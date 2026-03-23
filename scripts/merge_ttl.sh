#!/bin/bash

# Script to merge all TTL files in assets/ttl into merged.ttl
# Usage: ./scripts/merge_ttl.sh [output_dir]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TTL_DIR="$PROJECT_ROOT/assets/ttl"
OUTPUT_DIR="${1:-$PROJECT_ROOT/assets/ttl}"
OUTPUT_FILE="$OUTPUT_DIR/merged.ttl"

# Extract the body of a TTL file (everything after the header block of comments and prefixes)
get_body() {
    local file="$1"
    local in_header=true
    while IFS= read -r line; do
        if $in_header; then
            if [[ "$line" =~ ^prefix\  ]] || [[ "$line" =~ ^# ]] || [[ -z "$line" ]]; then
                continue
            fi
            in_header=false
            echo "$line"
        else
            echo "$line"
        fi
    done < "$file"
}

echo "Merging all TTL files into $OUTPUT_FILE..."

# Find all TTL files, excluding merged output
files=()
base_file=""
for f in "$TTL_DIR"/*.ttl; do
    [[ "$f" == */merged.ttl ]] && continue
    [[ "$f" == *_merged.ttl ]] && continue
    [ -f "$f" ] || continue
    # Use ontology.ttl as base if it exists
    if [[ "$f" == */ontology.ttl ]]; then
        base_file="$f"
    else
        files+=("$f")
    fi
done

if [ -z "$base_file" ] && [ ${#files[@]} -eq 0 ]; then
    echo "No TTL files found"
    exit 1
fi

# If no ontology.ttl, use the first file as base
if [ -z "$base_file" ]; then
    base_file="${files[0]}"
    files=("${files[@]:1}")
fi

local_total=$(( ${#files[@]} + 1 ))
echo "Found $local_total files to merge:"
echo "  - ${base_file##*/} (base)"
printf '  - %s\n' "${files[@]##*/}"

# Collect all unique prefix lines from all files
temp_prefixes=$(mktemp)
grep -E '^prefix ' "$base_file" >> "$temp_prefixes" 2>/dev/null || true
for f in "${files[@]}"; do
    grep -E '^prefix ' "$f" >> "$temp_prefixes" 2>/dev/null || true
done
unique_prefixes=$(sort -u "$temp_prefixes")
rm -f "$temp_prefixes"

# Build the output
mkdir -p "$OUTPUT_DIR"
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

    # Bodies of all other files
    for f in "${files[@]}"; do
        echo ""
        get_body "$f"
    done
} > "$OUTPUT_FILE"

echo "Created: $OUTPUT_FILE"
