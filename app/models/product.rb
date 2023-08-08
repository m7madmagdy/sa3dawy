class Product < ApplicationRecord
  belongs_to :source_page, required: false
  belongs_to :source

  validates :url, presence: true, uniqueness: true
  # validates :price, numericality: { greater_than: 0 }, on: :update

  after_update :format_price

  def format_price
    price = self.price.to_f
    "#{format('%.3f', price).gsub('.', ',')} EGP"
  end

  def product_image
    image_url = self.image_url.split(',')
    image_url.first
  end
end
