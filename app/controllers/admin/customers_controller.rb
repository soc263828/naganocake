class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
     @customers = Customer.all
     @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    redirect_to admin_customer_path
  end
end
