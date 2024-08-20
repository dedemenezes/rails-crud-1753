class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # Get all the restaurants from the DB
    # Send them to the view
    @restaurants = Restaurant.all
  end

  def show
    # raise # stop the code execution!
    # Find the right restaurant
    # params[:id] => return the number from the URL    # Send it to the view
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    # Create an empty instance of Restaurant
    # Send it to the view to be used in the form!
    @restaurant = Restaurant.new
  end

  def create
    # raise
    # INFORMATION COMING FROM THE FORM
    @restaurant = Restaurant.new(restaurant_params)
    # WE NEED TO AUTHORIZE/PERMIT THE FILEDS COMING FROM THE FORM
    @restaurant.save
    # DOESN'T HAVE A VIEW!
    # SEND THE USER SOMWHERE ELSE
    redirect_to restaurants_path  # HARD CODE DON'T DO '/restaurants'
  end

  def edit
    # Find the right instance of REstaurant
    # Send it to the view to be used in the form!
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # Find the right instance
    # @restaurant = Restaurant.find(params[:id])
    # Update the fields
    @restaurant.update(restaurant_params)
    # DOESN'T HAVE A VIEW!
    # SEND THE USER SOMWHERE ELSE
    redirect_to restaurant_path(@restaurant.id) # HARD CODE DON'T DO '/restaurants/46363464'
  end

  def destroy
    # Find the right instance
    # Call the method destroy
    @restaurant.destroy
    # DOESN'T HAVE A VIEW!
    # SEND THE USER SOMWHERE ELSE
    redirect_to restaurants_path, status: :see_other #check link on slack!
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # STRONG PARAMETERS
  def restaurant_params
    # require the params key referencing the form
    # permit the form fields WE added
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
