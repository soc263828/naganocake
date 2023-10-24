class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

  end

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :item_id, :amount)
  end
end
