class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors, :dependent => :destroy
  has_many :actors, through: :movie_actors

  def self.find_all_by_studio(studio)
    where(studio_id: studio.id)
  end
end
