class Event < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  has_many :draws, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :location, presence: true, length: { minimum: 2 }
  validates :date, presence: true, length: { minimum: 2 }
  validates :price, presence: true, length: { minimum: 2 }, numericality: { only_integer: true }
end
