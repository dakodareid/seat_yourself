class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def ensure_logged_in
  	unless current_user
  		flash[:alert] = "Please log in"
  		redirect_to new_session_path
  	end
  end

  private

  def current_user
  	@current_user ||= if session[:customer_id]
      Customer.find(session[:customer_id])
    elsif session[:owner_id]
      Owner.find(session[:owner_id])
    # else case? 
    end
  end
  helper_method :current_user
 
end
