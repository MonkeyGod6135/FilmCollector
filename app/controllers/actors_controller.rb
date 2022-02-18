class ActorsController < ApplicationController
	# index method gets called when the actors URL is requested.
	# index method gets mapped to the actors index.html.erb.
	def index
		#call all method on actor model class
		#all method selects all of the data in the actor table
		#and returns the data as an array of objects
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
# show method gets called when the actors/:id Url is requested
# show method is mapped to actors show.html.erb
def show
	# call the find method on actor model class giving it the id sent
	#in the request
	#find method selescts all of the data in the actor table where \
	# the id is equal to the id sent in the request 
	#selected dada will be returned in the array of movies 
	#store the array of movie objects in an instance vairable
	@movies = Actor.find(params[:id]).movies
end

# edit method gets called when the actors/:id/edit url is requested
# edit method is mapped to the actors edit.html.erb
def edit
	# call find method on actor model class giving it the id sent
	# in the request
	# the find method selects all of the data in the actor table where
	# the id is equal to the id sent in the request
	# the selected data will be returned as an object
	# the object will be stored in an instance variable that will be
	# available to the edit.html.erb
	@actor = Actor.find(params[:id])
end

# update method gets called when the update button is pressed
# actors edit.html.erb
def update
	# call find method on actor model class giving it the id sent
	# in the request
	# the find method selects all of the data in the actor table where
	# the id is equal to the id sent in the request
	# the selected data will be returned as an object
	# the object will be stored in an instance variable
	actor = Actor.find(params[:id])
	if actor.update(actor_params)
		redirect_to "/actors"
	else
		# if the update method fails, get the full messages assciated with the errors
	# store them in the rails flash object displayed in the requested Url
		flash[:errors] = actor.errors.full_messages
		redirect_to "/actors/#{actor.id}/edit"
end

# delete method gets called when the actors/:id/delete Url is requested
# delete method is mapped to actors delete.html.erb
def delete
		actor = Actor.find(params[:id])
		actor.destroy
		redirect_to "/actors"
end
	
	private
	def actor_params
		# params is a Rails object that gets the specified request
		#parameters
		params.require(:actor).permit(:first_name, :last_name)
	end


end