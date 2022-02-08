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
		#call constructor of Actor Model class giving it the 
		#first name and last name parameters input in the actors
		#new.html.erb
		#constructo creates Actor model object which is stored in avriable
		actor = Actor.new(actor_params)
		#call save method on Actor object
		if actor.save
			#if the save method succedes, request the actors url
			#which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full messages associated with errors
			# store them in a rails flash object named errors so that
			# the full message may be displayed
			flash[:errors] = actor.errors.full_messages
			#if the save method succedes, request the actors url
			#which will rendor the actors new.html.erb in the browser
			redirect_to "/actors/new"
			
		end
	end
	private
	def actor_params
		# params is a Rails object that gets the specified request
		#parameters
		params.require(:actor).permit(:first_name, :last_name)
	end
end
