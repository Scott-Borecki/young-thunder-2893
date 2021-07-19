class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.find_all_by_movie(@movie).order_by_youngest_age
  end

  def update
    movie = Movie.find(params[:id])
    actor = Actor.find_by_name(params[:name])
    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end
end
