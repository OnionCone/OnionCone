class Admin::OrdersController < ApplicationController
  def show
    # @order = Order.where(id: params[:id])
    @order = Order.find(params[:id])
    # @detail = @order.order_details
    @total = 0
  end

  def update
    
  end
end
