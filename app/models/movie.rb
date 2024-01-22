class Movie < ApplicationRecord
    has_many :bookings  
    has_one_attached :picture
end
