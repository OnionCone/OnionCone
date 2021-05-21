class Public::CartItemsController < ApplicationController
  def index
    @customer = current_customer
    # @cart_item = Cart_items.find(params[:id])
  end

#   def destroy
#     @cart_item = Cart_items.find(params[:id])  # データ（レコード）を1件取得
#     @cart_item.destroy  # データ（レコード）を削除
#     redirect_to cart_item_path(@cart_item.id)  # 投稿一覧画面へリダイレクト
#   end

#   def destroy_all
#     @cart_item = Cart_items.all
#     @cart_item.destroy
#     redirect_to cart_item_path(@cart_item.id)
#   end

#   def create
#   end

#   def update
#     @cart_item = Cart_items.find(params[:id])
#     @cart_item.update(cart_item_params)
#     redirect_to cart_item_path(@cart_item.id)
#   end


#   private
#   def cart_item_params
#     params.require(:cart_items).permit(:amount)
#   end
end
