class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, presence: true, length: { minimum: 2 }
end
