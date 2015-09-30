class PlacesController < ApplicationController
	def index
	  # Implemented Kaminari paginate
	  @places = Place.order(:name).page params[:page]
	end

	def new
	  @place = Place.new
	end

	# Sends to database
    def create
      Place.create(place_params)
      redirect_to root_path
    end

    private

    # Gets values from place form
    def place_params
      params.require(:place).permit(:name, :description, :address)
    end
end


