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
    @order.postage = 800
  end

  def thanks
    @cart_item = current_customer.oders
    @order
  end

  def create
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
　　@order.postage
　　@order.postal_code
　　@order.address
　　@order.name
　　@order.payment_method
　　@order.charge
    @order.save
    @cart_items.each do |item|
      order_detail = @order.order_details.new
      items.amount
      items.price
    end
    @cart_items = current_customer.cart_items.destroy
    redirect_to  orders_thanks_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
  params.require(:order).permit(:payment_method, :postage, :charge, :postal_code)
end

end
