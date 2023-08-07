class SourcePage < ApplicationRecord
  URL_REGEXP = Regexp.new("(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?")

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }

  delegate :source_config, to: :source

  belongs_to :source
  has_many :products
end
