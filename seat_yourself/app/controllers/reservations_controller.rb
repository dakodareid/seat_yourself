class ReservationsController < ApplicationController

	before_filter :load_restaurant
  
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

  	if @reservation.save
  		redirect_to restaurants_path
  	else
  		render :new
  	end
  end

private
	def reservation_params
		params.require(:reservation).permit(:restaurant_id, :date, :time, :party_size )
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end


