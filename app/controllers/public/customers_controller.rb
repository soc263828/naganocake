class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def quit
  end

  def out
  end
end
