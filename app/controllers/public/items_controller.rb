class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price)
  end
end
