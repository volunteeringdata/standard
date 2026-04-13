Jekyll::Hooks.register :site, :post_write do |site|
  if site.config["pagefind"]
    pagefind = system("pagefind", "--site", site.dest)
    pagefind || Jekyll.logger.warn("Pagefind:", "indexing failed")
  end
end
