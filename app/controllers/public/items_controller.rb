class Public::ItemsController < ApplicationController
  # skip_before_action :authenticate_customer!
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
