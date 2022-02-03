class ActorsController < ApplicationController
	# index method gets called when the actors URL is requested.
	# index method gets mapped to the actors index.html.erb.
	def index
		#call all method on actor model class
		#all method selects all of the data in the actor table
		#and returns teh data as an array of objects
		#store the array of objects in the instance variable.
		# instance variable is avaiable to the actors index.html.erb.
		@actors = Actor.all
	end

	# new method gets called when the actors/new method is requested
	# new method is mapped to the actors new.html.erb.
	def new
	end

	# create method gets called when the create button is pressed on
	# the actors new.html.erb
	def create
	end

end
