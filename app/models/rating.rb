class Rating < ApplicationRecord
  belongs_to :movie

  validates :movie_id, :rating, presence: true
end
