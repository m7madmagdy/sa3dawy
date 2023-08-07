class Source < ApplicationRecord
  has_many :products, through: :source_pages
  has_many :source_pages

  has_one :source_config
  accepts_nested_attributes_for :source_config, allow_destroy: true, update_only: true
end
