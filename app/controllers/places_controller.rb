class PlacesController < ApplicationController
	def index
	  # Variable to display everything from Place class in model
	  @places = Place.all
	end
end
