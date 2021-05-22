class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def destroy
    @cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    @cart_item.destroy  # データ（レコード）を削除
    redirect_to public_cart_items_path  # 投稿一覧画面へリダイレクト
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    # params.require(:cart_items).permit(:amount)
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end