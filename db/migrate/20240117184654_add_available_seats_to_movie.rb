class AddAvailableSeatsToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :available_seats, :integer
  end
end
