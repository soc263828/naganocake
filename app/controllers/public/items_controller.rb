class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @item.save!
    redirect_to cart_items_path(@item)
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :item_id, :amount)
  end
end
