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
    total = 0
    @cart_items.each do |cart_item|
      total += cart_item.subtotal
    end
    @order.charge = total
    @order.postage = 800
  end

  def thanks
    @cart_item = current_customer.oders
    @order
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    @order.save

    @cart_items.each do |item|
      order_detail = OrderDetail.new
      order_detail.order_id =@order.id
      order_detail.item_id = item.item_id
      order_detail.amount = item.amount
      order_detail.price =(item.item.price*1.1).floor
      order_detail.save
    end
    current_customer.cart_items.destroy_all
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
  params.require(:order).permit(:payment_method, :postage, :charge, :postal_code, :address, :name, :order_id, :item_id, :cart_item)
end

end
