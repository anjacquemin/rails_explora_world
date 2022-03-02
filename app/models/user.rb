class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages
  has_many :rentals
  has_many :slots
  has_many :offers, dependent: :destroy
  has_many :reviews, through: :rentals

  belongs_to :agency

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.others(user)
    User.where.not(id: user.id)
  end
end
