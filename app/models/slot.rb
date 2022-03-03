class Slot < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  has_many :rentals
  has_one :chatroom

  validates :start_at, presence: true
end
