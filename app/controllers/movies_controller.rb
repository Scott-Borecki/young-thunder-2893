class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.by_movie(@movie)
  end
end
