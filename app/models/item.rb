class Item < ApplicationRecord
  belongs_to :wishlist
  validates :product, presence: true
end
