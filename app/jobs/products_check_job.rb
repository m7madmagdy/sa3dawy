class ProductsCheckJob
    include Sidekiq::Job
    sidekiq_options queue: :default, retry: 2

    def perform
        products = Product.all
        products.update_all(updated_at: Time.now)
        products.each(&:enqueue_scraper_job)
    end
end