class Movie < ApplicationRecord
  belongs_to :studio

  def self.by_studio(studio)
    where(studio_id: studio.id)
  end
end
