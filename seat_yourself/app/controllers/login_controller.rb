class LoginController < ApplicationController
  def index
  	if @current_user 
  		redirect_to restaurants_path
  	else
  	end
  end
end
