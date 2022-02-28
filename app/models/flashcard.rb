class Flashcard < ApplicationRecord
  belongs_to :offer

  validates :question, presence: true
  validates :answer, presence: true
end
