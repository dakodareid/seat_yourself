class CustomersController < ApplicationController
  def show
  end

  def new
  	@cusomter = Customer.new
  end

  def edit
  	
  end

  def create
  	@customer = Customer.new(customer_params)

  	if @customer.save 
  		redirect_to restaurants_path
  	else
  		render :new
  	end
  end


private

	def customer_params
		params.require(:customer).permit(:name, :email)
	end
end
