class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, presence: true

  after_create :decrease_available_seats

  private

  def decrease_available_seats
    movie.update(available_seats: movie.available_seats-1)
  end
end
