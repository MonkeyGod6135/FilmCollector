class AppearancesController < ApplicationController
	# index method gets called when the apperances url is requested
	# index method is mapped to the appearances index.html.erb
	def index
		#call all method on actor model class
		#all method selects all of the data in the actor table
		#and returns the data as an array of objects
		#store the array of objects in the instance variable.
		# instance variable is avaiable to the apperances index.html.erb.
		@actors = Actor.all
		#call all method on Movie model class
		#all method selects all of the data in the Movie table
		#and returns the data as an array of objects
		#store the array of objects in the instance variable.
		# instance variable is avaiable to the apperances index.html.erb.
		@movies = Movie.all
		return @actors, @movies
	end 

	# create method gets called when the create button is pressed on
	# the appearances index.html.erb
	def create
		#call constructor of appearances Model class giving it the 
		#actor id and movie id parameters input in the appearance table
		#appearance.html.erb
		#constructer creates appearance model object which is stored in avaiable
		appearance = Appearance.new(appearance_params)
		#call save method on appearance object
		if appearance.save
			#if the save method succedes, request the appearance url
			#which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full messages associated with errors
			# store them in a rails flash object named errors so that
			# the full message may be displayed
			flash[:errors] = appearance.errors.full_messages
			#if the save method succedes, request the actors url
			#which will rendor the appearance index.html.erb in the browser
			redirect_to "/appearances/index"
		end
	end
	
	private
	def appearance_params
		# params is a Rails object that gets the specified request
		# parameters
		params.require(:appearance).permit(:actor_id, :movie_id)
	end
end