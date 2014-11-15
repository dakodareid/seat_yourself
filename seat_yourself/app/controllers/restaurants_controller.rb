class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in

  before_filter :can_create_restaurant, only: [:new, :create, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurants_path
      else
        render :new
      end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_path(@restaurant)
    else
      render :edit
    end
  end

  # def space_available(datetime)

  # end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :seats, :url)
  end

  def can_create_restaurant
    unless current_user.is_a?(Owner)
      redirect_to restaurants_path, notice: "Can touch this. Duh nuh nuh."
    end
  end

end
