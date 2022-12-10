class User < ApplicationRecord
  has_many :events
  has_many :participants
  has_one :wishlist
  has_many :items, through: :wishlist

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
