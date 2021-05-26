class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.page(params[:page]).per(10)
    @customer = current_customer
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
