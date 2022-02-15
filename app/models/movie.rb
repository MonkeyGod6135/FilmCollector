class Movie < ApplicationRecord
	#has_many method sepcifies a one to many relationship
	# appearences option specfifes that one movie has many appearences
	has_many :appearances
	# movies option specifies that one movie hsa many actors 
	#the through option specifies that one realtionship exists
	#only through apppearances
	has_many :actors, through: :appearances
	#validates method specifies that an movie is vaild only if
	#title, duration, rating, release_date values are present
	validates :title, :duration, :rating, :release_date, presence: true
end
