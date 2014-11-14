class SessionsController < ApplicationController
  def new
  end

  def create
  	  customer = Customer.find_by_email(params[:email])
  	if customer && customer.authenticate(params[:password])
  		session[:customer_id] = customer.id
  		redirect_to restaurants_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or passowrd"
  		render "new"
  	end
  end

  def destroy
  	session[:customer_id] = nil
  	redirect_to log_in_url, notice: "Logged out"
  	#**************^log in************
  end
end
