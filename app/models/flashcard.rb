class Flashcard < ApplicationRecord
  belongs_to :offer

  has_one_attached :photo

  validates :question, presence: true
  validates :answer, presence: true
end
