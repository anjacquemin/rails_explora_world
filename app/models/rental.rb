class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  has_many :reviews
end
