class Product < ApplicationRecord
  belongs_to :source_page, required: false

  validates :url, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }, on: :update
end
