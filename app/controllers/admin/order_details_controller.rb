class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order = OrderDetail.find(params[:id])
    # temp = order_params
    # temp[:making_status] = temp[:making_status].to_i
    order.update(order_params)
    num = order.order_id
    redirect_to admin_order_path(num)
  end

  private
  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end
