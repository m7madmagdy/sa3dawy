module Scrapers
  class ProductUrls
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix
    URL_PREFIX = "https://sa3dawy.com/".freeze

    def initialize(source_page_id)
      @source_page = SourcePage.find source_page_id
      source = @source_page.source
      @url = @source_page.url
      @source_config = source.source_config
    end

    def perform
      @document = fetch_document
      urls = fetch_urls
      Products::Create.call(urls, @source_page.id)
    end

    def fetch_urls
      urls = @document.search @source_config.products_url_selector
      urls = urls.map(&:values).flatten.uniq
      urls = urls.map { |url| URL_PREFIX + url }
      urls = urls.reject! { |url| url.include?('btn _btnread_14luk_103 btn') }
      urls.select { |url| url.match? URL_REGEXP }
    end

    def fetch_document
      mechanize_agent = Mechanize.new
      mechanize_agent.user_agent_alias = 'Linux Mozilla'
      document = mechanize_agent.get(@url)
      document.encoding = 'utf-8'
      document
    end
  end
end
