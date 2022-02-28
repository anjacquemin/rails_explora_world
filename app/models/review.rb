class Review < ApplicationRecord
  belongs_to :rental

  validates :rating, inclusion: {in: [0,1,2,3,4,5]}
  validates :content, length: { minimum: 10 }

end
