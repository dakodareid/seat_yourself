class ReservationsController < ApplicationController

	before_filter :load_restaurant
  before_filter :ensure_logged_in
  
  def show
  	 @reservation = Reservation.find(params[:id])
  end

  def new
  	 @reservation = Reservation.new
  end

  def edit
  	 @reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_user.id
    @reservation.restaurant_id = params[:restaurant_id]

    # binding.pry
  	if @reservation.save
      flash[:notice] = "Reservation created!"
  		redirect_to restaurants_path
  	else
      flash[:notice] = "Reservation failed! #{@reservation.errors.full_messages}"
  		render :new
  	end
  end

private
	def reservation_params
		params.require(:reservation).permit(:restaurant_id, :reservation_date, :reservation_time, :party_size )
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
 
end


