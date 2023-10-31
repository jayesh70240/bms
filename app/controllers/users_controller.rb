class UsersController < ApplicationController
    def users_booking
    end
    def cart
        @user_bookings = current_user.bookings.includes(:movie)
    end
end