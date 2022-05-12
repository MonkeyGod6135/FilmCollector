class Movie < ApplicationRecord

	has_many :ratings
	#has_many method sepcifies a one to many relationship
	# appearences option specfifes that one movie has many appearences
	has_many :appearances, dependent: :destroy 
	# movies option specifies that one movie to many actors 
	#the through option specifies that one realtionship exists
	#only through apppearances
	has_many :actors, through: :appearances
	#validates method specifies that an movie is vaild only if
	#title, duration, rating, release_date values are present
	validates :title, :duration, :rating, :release_date, presence: true
end
