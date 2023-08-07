json.extract! source_page, :id, :name, :url, :source_id, :created_at, :updated_at
json.url source_page_url(source_page, format: :json)
