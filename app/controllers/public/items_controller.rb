class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.page(params[:page]).per(8)
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  # @current_item_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  # @categories = OrderDetail.all
  end
end
