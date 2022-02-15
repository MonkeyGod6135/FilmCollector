class Actor < ApplicationRecord
	#has_many method sepcifies a one to many relationship
	# appearences option specfifes that one actor has many appearences
	has_many :appearances
	# movies option specifies that one actor hsa many moviews 
	#the through option specifies that one realtionship exists
	#only through apppearacnes
	has_many :movies, through: :appearances
	#validates method specifies that an actor is vaild only if
	#both values are present
	validates :first_name, :last_name, presence: true
end
