class SessionsController < ApplicationController
  def new
  end

  def create
    user = Customer.find_by_email(params[:email]) || Owner.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		if user.is_a?(Customer)
        session[:customer_id] = user.id
      elsif user.is_a?(Owner)
        session[:owner_id] = user.id
      end
  		redirect_to restaurants_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
    session[:owner_id] = nil
  	session[:customer_id] = nil
  	redirect_to restaurants_url, notice: "Logged out"
  	#**************^log in************
  end
end
