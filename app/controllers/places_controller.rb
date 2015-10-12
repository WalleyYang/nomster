class PlacesController < ApplicationController
  	# Before filter to require user to be logged in for new and create
    before_action :authenticate_user!, :only => [:new, :create]

    def index
  	  # Implemented Kaminari paginate
  	  @places = Place.order(:name).page params[:page]
  	end

  	def new
  	  @place = Place.new
  	end

	# Sends to database
    def create
      current_user.places.create(place_params)
      redirect_to root_path
    end

    def show
      @place = Place.find(params[:id])
    end

    def edit
      @place = Place.find(params[:id])
    end

    private

    # Gets values from place form
    def place_params
      params.require(:place).permit(:name, :description, :address)
    end
end


