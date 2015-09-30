class PlacesController < ApplicationController
	def index
	  # Implemented Kaminari paginate
	  @places = Place.order(:name).page params[:page]
	end

	def new
	  @place = Place.new
	end
end


