class MoviesController < ApplicationController
	# index method gets called when the actors URL is requested.
	# index method gets mapped to the actors index.html.erb.
	def index
		#call all method on Movie model class
		#all method selects all of the data in the Movie table
		#and returns the data as an array of objects
		#store the array of objects in the instance variable.
		# instance variable is avaiable to the Movies index.html.erb.
		@movies = Movie.all
	end


	# new method gets called when the Movies/new method is requested
	# new method is mapped to the movies new.html.erb.
	def new
	end

	# create method gets called when the create button is pressed on
	# the movies new.html.erb
	def create
		#call constructor of movie Model class giving it the 
		#title, duration, rating, and release_date parameters input in the movies
		#new.html.erb
		#constructer creates movie model object which is stored in a variable
		movie = Movie.new(movie_params)
		#call save method on movie object
		if movie.save
			#if the save method succedes, request the movies url
			#which will rendor the movies index.html.erb in the browser
			redirect_to "/movies"
		else
			# get full messages associated with errors
			# store them in a rails flash object named errors so that
			# the full message may be displayed
			flash[:errors] = movie.errors.full_messages
			#if the save method succedes, request the movies url
			#which will rendor the movies new.html.erb in the browser
			redirect_to "/movies/new"
			
		end
	end
	
	def show
	# call the find method on movie model class giving it the id sent
	#in the request
	#find method selescts all of the data in the movie table where \
	# the id is equal to the id sent in the request 
	#selected dada will be returned in the array of actors 
	#store the array of actors objects in an instance vairable
	@actors = Movie.find(params[:id]).actors
end

# edit method gets called when the movies/:id/edit url is requested
# edit method is mapped to the movies edit.html.erb
def edit
	# call find method on actor model class giving it the id sent
	# in the request
	# the find method selects all of the data in the actor table where
	# the id is equal to the id sent in the request
	# the selected data will be returned as an object
	# the object will be stored in an instance variable that will be
	# available to the edit.html.erb
	@movie = Movie.find(params[:id])
end

# update method gets called when the update button is pressed
# movies edit.html.erb
def update
	# call find method on movie model class giving it the id sent
	# in the request
	# the find method selects all of the data in the movie table where
	# the id is equal to the id sent in the request
	# the selected data will be returned as an object
	# the object will be stored in an instance variable
	movie = Movie.find(params[:id])
	if movie.update(movie_params)
		redirect_to "/movies"
	else
	# if the update method fails, get the full messages assciated with the errors
	# store them in the rails flash object displayed in the requested Url
		flash[:errors] = movie.errors.full_messages
		redirect_to "/movies/#{movie.id}/edit"
	end
end

# delete method gets called when the movies/:id/delete url is requested
# delete method is mapped to the movies delete.html.erb
def delete
	# call find method on movie model class giving it the id sent
	# in the request
	# the find method selects all of the data in the movie table where
	# the id is equal to the id sent in the request
	# the selected data will be returned as an object
	# the object will be stored in an instance variable that will be
	# available to the edit.html.erb
	@movie = Movie.find(params[:id])
end

# destroy method gets called when the movies/:id/delete Url is requested
# destroy method is mapped to movie delete.html.erb
def destroy
		movie = Movie.find(params[:id])
		movie.destroy
		redirect_to "/movies"
end

	private
	def movie_params
		# params is a Rails object that gets the specified request
		#parameters
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end


end
