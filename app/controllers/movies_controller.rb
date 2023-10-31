class MoviesController < ApplicationController
    def show
        @movief = Movie.find(params[:id])
        @cinema = @movief.cinema
        @category = @movief.category
    end
end