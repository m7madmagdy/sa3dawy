class ProductDetailsJob
  include Sidekiq::Job
  sidekiq_options queue: :product_details_scraper, retry: 1

  def perform(product_id)
    Scrapers::ProductDetails.new(product_id).perform
  end
end
