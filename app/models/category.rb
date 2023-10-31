class Category < ApplicationRecord
    has_many :movies
    has_many :bookings, through: :movies
end
