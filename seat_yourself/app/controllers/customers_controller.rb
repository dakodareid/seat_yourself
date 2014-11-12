class CustomersController < ApplicationController
  
  def show
  	@customer = Customer.find(params[:id])
  end

  def new
  	@customer = Customer.new
  end

  def edit
  	  @customer = Customer.find(params[:id])
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
