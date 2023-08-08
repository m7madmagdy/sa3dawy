module Scrapers
  class ProductDetails
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    attr_reader :product

    def initialize(product_id)
      @product = Product.find product_id
      @source = product.source
      @source_config = @source.source_config
      @url = product.url
    end

    def perform
      @document = fetch_document
      name = fetch_title
      price = fetch_price
      image_url = fetch_image
      description = fetch_description
      product_details = { name: name, description: description, price: price, image_url: image_url}

      Products::Update.call(@product.id, product_details)
    end

    def fetch_title
      @document.search(@source_config.name_selector).first.text.strip
    end

    def fetch_price
      price = fetch_description

      price = price.scan(/Price:\s*([\d,.]+)\s*(EGP)?/).flatten
      price.first
    end

    def fetch_image
      image_selector = @document.at(@source_config.image_url_selector)

      if image_selector
        style_attr = image_selector['style']
        url_match = style_attr.match(/url\('([^']+)'\)/)
        url_match[1]
      end
    end

    def fetch_description
      @document.search(@source_config.description_selector).text.strip
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
