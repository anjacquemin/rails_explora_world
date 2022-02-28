class Slot < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  has_many :rentals

  validates :start_at, presence: true
end
