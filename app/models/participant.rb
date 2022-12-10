class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :draws, through: :events

  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, length: { minimum: 2 }

end
