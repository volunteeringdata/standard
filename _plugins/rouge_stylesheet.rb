require 'rouge'

module Jekyll
  class RougeStylesheet < Jekyll::StaticFile
    def initialize(site, theme_name)
      @theme_name = theme_name
      super(site, site.source, 'assets/css', 'syntax.css')
    end

    def write(dest)
      theme_class = Rouge::Theme.find(@theme_name) || Rouge::Themes::Github
      css = theme_class.render(scope: '.highlight')
      out = File.join(dest, 'assets', 'css', 'syntax.css')
      FileUtils.mkdir_p(File.dirname(out))
      File.write(out, css)
      true
    end
  end

  class RougeStylesheetGenerator < Jekyll::Generator
    def generate(site)
      theme_name = site.config['rouge_theme'] || 'github'
      site.static_files << RougeStylesheet.new(site, theme_name)
    end
  end
end
