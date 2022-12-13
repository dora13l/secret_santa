class Draw < ApplicationRecord
  belongs_to :event
  has_one :participant
  has_one :user
end
