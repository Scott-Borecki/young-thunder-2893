class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.by_movie(movie)
    joins(:movie_actors).where(movie_actors: { movie_id: movie.id })
  end
end
