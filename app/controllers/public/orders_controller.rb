class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def log
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def thanks
    @cart_item = current_customer.oders
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

private
def order_params
  params.require(:order).permit(:payment_method)
end

end
