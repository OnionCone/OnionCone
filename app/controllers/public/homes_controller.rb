class Public::HomesController < ApplicationController
  def top
    @item = Item.all
    @items = Item.page(params[:page]).per(4)
    @customer = current_customer
  end
  def about
  end
end
