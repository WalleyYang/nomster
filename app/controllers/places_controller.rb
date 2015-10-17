class PlacesController < ApplicationController
  	# Before filter to require user to be logged in for new and create
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

    def index
  	  # Implemented Kaminari paginate
  	  @places = Place.order(:name).page params[:page]
  	end

  	def new
  	  @place = Place.new
  	end

	# Sends to database
    def create
      @place = current_user.places.create(place_params)
      # Is item saved?
      if @place.valid?
        redirect_to root_path
      else
      # Render new action, tells browser of validation error
      render :new, :status => :unprocessable_entity
      end
    end

    def show
      @place = Place.find(params[:id])
      @comment = Comment.new
    end

    def edit
      @place = Place.find(params[:id])

      if @place.user != current_user
        return render :text => 'Not Allowed', :status => :forbidden
      end
    end

    def update
      @place = Place.find(params[:id])

      if @place.user != current_user
        return render :text => 'Not Allowed', :status => :forbidden
      end

      @place.update_attributes(place_params)
      
      if @place.valid?
        redirect_to root_path
      else
        render :edit, :status => :unprocessable_entity
      end
    end

    def destroy
      @place = Place.find(params[:id])
      
      if @place.user != current_user
        return render :text => 'Not Allowed', :status => :forbidden
      end
      
      @place.destroy
      redirect_to root_path
    end

    private

    # Gets values from place form
    def place_params
      params.require(:place).permit(:name, :description, :address)
    end
end


