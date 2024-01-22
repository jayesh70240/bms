class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_movie, only: [:new, :create]

  
    def index
      @bookings = current_user.bookings
    end
  
    def new
      @booking = Booking.new
    end
  
    def create
      @booking = current_user.bookings.new(booking_params.merge(movie: @movie))
      
  
      if @booking.save
        redirect_to bookings_path, notice: 'Booking was successfully created.'
        UserMailer.booking_confirmation(current_user, @booking).deliver_now
      else
        render :new
      end
    end
  
    def destroy
      @booking = current_user.bookings.find(params[:id])
      @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully canceled.'
    end

    private

    def set_movie
     @movie = Movie.find(params[:movie_id])
    end

    def booking_params
      params.require(:booking).permit(:date)
    end
end
