class Public::ItemsController < ApplicationController
  def index
    # @cart_item = Cart_items.find(params[:id])
    @item = Item.all
    @items = Item.page(params[:page]).per(8)
    @customer = current_customer
  end
  def show
  @item = Item.find(params[:id])

  # @current_item_array = []                   #配列を生成
  # @items.current_item.times do |amount|   #@stockの現在の在庫数まで、ループを回す。
  #   if amount < 10                          #quantityが10未満かどうか？
  #     @current_item_array += amount + 1
  #     #quantityは0からスタートしているので、1足した数を入れる必要がある。
  #   else
  #     break                                   #ループを抜ける
  #   end
  # end
  # @current_item_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
end
