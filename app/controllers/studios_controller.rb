class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    @movies = Movie.all
  end
end
