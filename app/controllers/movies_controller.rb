class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    
    def index
      @movies = Movie.all
    end
    
    def show
      @booking = Booking.new
    end
    
    def new
      @movie = Movie.new
    end
    
    def create
      @movie = Movie.new(movie_params)
  
      if @movie.save
        redirect_to new_movie_booking_path(@movie), notice: 'Movie was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @movie.update(movie_params)
        redirect_to @movie, notice: 'Movie was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @movie.destroy
      redirect_to movies_url, notice: 'Movie was successfully destroyed.'
    end
    
    def book
        @booking = current_user.bookings.build(movie: @movie)
    
        if @booking.save
          redirect_to bookings_path, notice: 'Booking was successfully created.'
        else
          render :show
        end
    end

    private
    
    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def movie_params
        params.require(:movie).permit(:title, :description, :available_seats, :picture)
      end
end
