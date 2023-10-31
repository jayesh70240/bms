class BookingsController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @booking = Booking.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @booking = Booking.new(booking_params)
    if user_signed_in?
      @booking.user_id = current_user.id
      if @booking.save
        redirect_to bookings_path, notice: 'Your Booking is successful'
      else
        render :new
      end
    else
      redirect_to login_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:movie_id)
  end
end
