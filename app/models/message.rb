class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 10 }
end
