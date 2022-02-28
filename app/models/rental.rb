class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :slot, dependent: :destroy

  has_many :reviews
end
