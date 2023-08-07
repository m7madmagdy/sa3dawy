class Source < ApplicationRecord
  URL_REGEXP = Regexp.new("(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?")
 
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }

  has_many :source_pages, dependent: :destroy
  has_many :products, through: :source_pages

  has_one :source_config
  accepts_nested_attributes_for :source_config, allow_destroy: true, update_only: true
end
