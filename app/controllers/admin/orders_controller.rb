class Admin::OrdersController < ApplicationController
  def show
    # @order = Order.where(id: params[:id])
    @order = Order.find(params[:id])
    # @detail = @order.order_details
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    temp = order_params
    temp[:status] = temp[:status].to_i
    @order.update(temp)
    redirect_to admin_order_path(@order)
  end

    private

  def order_params
    params.require(:order).permit(:status)
  end

end
