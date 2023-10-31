class Movie < ApplicationRecord
  has_many :cinemas
  has_many :categories

  has_many :bookings
  has_many :users, through: :bookings
end
