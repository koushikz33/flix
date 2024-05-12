class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites , source: :movie
  
  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ } , uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 10, allow_blank: true }
  
  has_secure_password
end
