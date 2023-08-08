class Product < ApplicationRecord
  belongs_to :source_page, required: false
  belongs_to :source

  validates :url, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }, on: :update
end
