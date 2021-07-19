class Actor < ApplicationRecord
  has_many :movie_actors, :dependent => :destroy
  has_many :movies, through: :movie_actors

  def self.find_all_by_movie(movie)
    joins(:movie_actors).where(movie_actors: { movie_id: movie.id })
  end

  def self.order_by_youngest_age
    order(:age)
  end

  def self.average_age
    average(:age).round(2)
  end

  def coactors
    Actor.joins(:movies).where(movies: {id: [movies]}).where.not(actors: {id: self.id})
  end
end
