class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.by_movie(movie)
    joins(:movie_actors).where(movie_actors: { movie_id: movie.id })
  end

  def self.order_by_youngest_age
    order(:age)
  end

  def self.average_age
    average(:age).round(2)
  end

  def coactors
    movies.each_with_object([]) do |movie, array|
      movie.actors.each do |actor|
        array << actor unless actor == self
      end
    end.uniq
  end
end
