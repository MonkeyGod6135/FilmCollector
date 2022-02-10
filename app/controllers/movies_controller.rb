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
	private
	def movie_params
		# params is a Rails object that gets the specified request
		#parameters
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end

end
