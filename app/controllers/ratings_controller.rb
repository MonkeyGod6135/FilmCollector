class RatingsController < ApplicationController

	def index
		@ratings = Rating.all
		@movies = Movie.all
		return @movies
	end 

	def new
		@movies = Movie.all
	end

	def create
		rating = Rating.new(rating_params)
		if rating.save
			redirect_to "/ratings"
		else
			flash[:errors] = rating.errors.full_messages
			redirect_to "/ratings/index"
		end
	end

	private
	def rating_params
		# params is a Rails object that gets the specified request
		# parameters
		params.require(:rating).permit(:movie_id, :rating)
	end

end
