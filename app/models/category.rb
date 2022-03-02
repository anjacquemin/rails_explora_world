class Category < ApplicationRecord
  has_many :offers

  validates :name, presence: true
  validates :name, inclusion: { in: ["Museum", "Monument", "Neighborhood"] }


end
