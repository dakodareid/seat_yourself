class OwnersController < ApplicationController
  before_filter :ensure_logged_in, except: [:create, :new]
  def show
  	 @owner = Owner.find(params[:id])
  end

  def new
  	 @owner = Owner.new
  end

  def edit
  	 @owner = Owner.find(params[:id])
  end

  def create
  	@owner= Owner.new(owner_params)

  	if @owner.save 
  		redirect_to restaurants_path, notice: "Signed up!"
  	else
  		render :new
  	end

  end

private
	def owner_params
		params.require(:owner).permit(:email, :password, :password_confirmation)
	end
end
