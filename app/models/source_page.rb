class SourcePage < ApplicationRecord
  belongs_to :source
  has_many :products
end
