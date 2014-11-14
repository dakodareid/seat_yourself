class LoginController < ApplicationController
  def index
  	if @current_user 
  		redirect_to restaurants_url
  	else
  	end
  end
end
