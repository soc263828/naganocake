class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    @customer_new = Item.new
    @customer = @item.customer
  end

  def edit
  end

  def update
  end
end
