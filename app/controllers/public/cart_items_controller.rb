class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def update
  end

  def destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :image,)
  end

end
