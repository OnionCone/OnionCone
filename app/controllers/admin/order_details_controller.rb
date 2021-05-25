class Admin::OrderDetailsController < ApplicationController
  def update
    order = OrderDetail.find(params[:id])
    temp = order_params
    temp[:making_status] = temp[:making_status].to_i
    order.update(temp)
    redirect_to admin_root_path
  end

  private
  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end
