class Movie < ApplicationRecord
	#validates method specifies that an actor is vaild only if
	#title, duration, rating, release_date values are present
	validates :title, :duration, :rating, :release_date, presence: true
end
