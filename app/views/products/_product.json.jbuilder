json.extract! product, :id, :name, :price, :url, :image_url, :description, :source_page_id, :created_at, :updated_at
json.url product_url(product, format: :json)
