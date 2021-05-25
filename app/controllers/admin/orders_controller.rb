class Admin::OrdersController < ApplicationController
  def show
    # @order = Order.where(id: params[:id])
    @order = Order.find(params[:id])
    # @detail = @order.order_details
    @total = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_root_path
  end

    private
  def order_params
    params.require(:order).permit(:status)
  end
end