class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order = OrderDetail.find(params[:id])
    num = order.order_id
    # detail = OrderDetail.where(id: "製作完了").count
    # details = order.count
    # temp = order_params
    # temp[:making_status] = temp[:making_status].to_i
    order.update(order_params)
    order.auto_update
    order.complete_auto_update
    # その注文に付随するdetailsの数(whereを使う)が全て完了” = "detailsの総数"(countのみ)の時に"発送待ち"updateする
    redirect_to admin_order_path(num)
  end

    # 製作ステータスが全部「製作完了」になったら注文ステータスが「発送準備中」に自動更新
  # def
  #   if  order.product_orders.all? do |p|
  #         p.product_order_status_before_type_cast == 3
  #       end
  #     order.update(order_status: 3)
  #     flash[:success] = "注文ステータスが「発送準備中」に更新されました"
  #   end
  # end

  private
  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end

