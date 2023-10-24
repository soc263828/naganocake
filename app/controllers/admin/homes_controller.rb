class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    
  end

  private
def order_params
  params.require(:order).permit(:payment_method, :postage, :charge, :postal_code, :address, :name, :order_id, :item_id, :cart_item, :amount)
end

end
