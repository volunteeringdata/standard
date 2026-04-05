require 'rouge'

module Jekyll
  class ConcatStyles < Jekyll::StaticFile
    def initialize(site, input_dir, output_path, rouge_theme, minify)
      @input_dir = input_dir
      @rouge_theme = rouge_theme
      @minify = minify
      dir = File.dirname(output_path)
      name = File.basename(output_path)
      super(site, site.source, dir, name)
    end

    def write(dest)
      source_dir = File.join(@site.source, @input_dir)
      css_files = Dir.glob(File.join(source_dir, '**', '*.css')).sort

      content = css_files.map { |f| File.read(f) }.join("\n")

      if @rouge_theme
        theme_class = Rouge::Theme.find(@rouge_theme) || Rouge::Themes::Github
        content << "\n" << theme_class.render(scope: '.highlight')
      end

      if @minify
        content = content
          .gsub(/\/\*.*?\*\//m, '')  # remove comments
          .gsub(/\s*\n\s*/, '')      # remove newlines and surrounding whitespace
          .gsub(/\s*([{}:;,>~+])\s*/, '\1') # remove whitespace around symbols
          .strip
      end

      out = File.join(dest, @dir, @name)
      FileUtils.mkdir_p(File.dirname(out))
      File.write(out, content)
      true
    end

    def modified?
      source_dir = File.join(@site.source, @input_dir)
      out = File.join(@site.dest, @dir, @name)
      return true unless File.exist?(out)

      output_mtime = File.mtime(out)
      Dir.glob(File.join(source_dir, '**', '*.css')).any? { |f| File.mtime(f) > output_mtime }
    end
  end

  class ConcatStylesGenerator < Jekyll::Generator
    def generate(site)
      styles = site.config['styles']
      return unless styles && styles['input'] && styles['output']

      input_dir = styles['input'].sub(/^\//, '')
      output_path = styles['output'].sub(/^\//, '')

      # Remove individual CSS source files from output (but keep the concatenated file)
      site.static_files.reject! do |f|
        path = f.relative_path.sub(/^\//, '')
        path.start_with?(input_dir) && path != output_path
      end

      minify = styles['minify'] != false

      site.static_files << ConcatStyles.new(site, styles['input'], styles['output'], styles['rouge_theme'], minify)
    end
  end
end
