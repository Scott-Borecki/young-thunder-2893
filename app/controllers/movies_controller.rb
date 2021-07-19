class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.by_movie(@movie).order_by_youngest_age
  end
end
