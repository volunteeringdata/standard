#!/bin/bash

# Script to merge TTL files in assets/ttl into two batches: ontology and taxonomy
# Usage: ./scripts/merge_ttl.sh [output_dir]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TTL_DIR="$PROJECT_ROOT/assets/ttl"
OUTPUT_DIR="${1:-$PROJECT_ROOT/assets/ttl}"

# Extract the body of a TTL file (everything after the header block of comments and prefixes)
get_body() {
    local file="$1"
    local in_header=true
    local found_prefix=false
    while IFS= read -r line; do
        if $in_header; then
            # Header consists of comments, prefix lines, and blank lines before content
            if [[ "$line" =~ ^prefix\  ]] || [[ "$line" =~ ^# ]] || [[ -z "$line" ]]; then
                if [[ "$line" =~ ^prefix\  ]]; then
                    found_prefix=true
                fi
                continue
            fi
            # First non-header line: stop skipping
            in_header=false
            echo "$line"
        else
            echo "$line"
        fi
    done < "$file"
}

# Function to merge TTL files
merge_ttl_files() {
    local base_name="$1"   # e.g. "ontology" or "taxonomy"
    local output_file="$2"
    local base_file="$TTL_DIR/${base_name}.ttl"

    echo "Merging ${base_name} files into $output_file..."

    # Find all matching files, excluding the merged output and the base file
    local files=()
    for f in "$TTL_DIR/${base_name}"*.ttl; do
        [[ "$f" == *_merged.ttl ]] && continue
        [[ "$f" == "$base_file" ]] && continue
        [ -f "$f" ] && files+=("$f")
    done

    if [ ! -f "$base_file" ] && [ ${#files[@]} -eq 0 ]; then
        echo "No files found for: $base_name"
        return 1
    fi

    # Use first sub-file as base if no base file exists
    local has_base=true
    if [ ! -f "$base_file" ]; then
        has_base=false
        base_file="${files[0]}"
        files=("${files[@]:1}")
    fi

    local total=$(( ${#files[@]} + 1 ))
    echo "Found $total files to merge:"
    echo "  - ${base_file##*/} (base)"
    printf '  - %s\n' "${files[@]##*/}"

    # Collect all unique prefix lines from all files
    local temp_prefixes=$(mktemp)
    grep -E '^prefix ' "$base_file" >> "$temp_prefixes" 2>/dev/null || true
    for f in "${files[@]}"; do
        grep -E '^prefix ' "$f" >> "$temp_prefixes" 2>/dev/null || true
    done
    local unique_prefixes
    unique_prefixes=$(sort -u "$temp_prefixes")
    rm -f "$temp_prefixes"

    # Build the output: header from base file (with merged prefixes), then all bodies
    {
        # Reproduce the comment header from the base file up to (but not including) the first prefix
        while IFS= read -r line; do
            if [[ "$line" =~ ^prefix\  ]]; then
                break
            fi
            echo "$line"
        done < "$base_file"

        # Write deduplicated prefixes
        echo "$unique_prefixes"

        # Body of the base file
        echo ""
        get_body "$base_file"

        # Bodies of all sub-files
        for f in "${files[@]}"; do
            echo ""
            get_body "$f"
        done
    } > "$output_file"

    echo "Created: $output_file"
    echo ""
}

# Create output directory if needed
mkdir -p "$OUTPUT_DIR"

# Merge ontology files
merge_ttl_files "ontology" "$OUTPUT_DIR/ontology_merged.ttl"

# Merge taxonomy files
merge_ttl_files "taxonomy" "$OUTPUT_DIR/taxonomy_merged.ttl"

echo "Done! Merged files created in: $OUTPUT_DIR"
