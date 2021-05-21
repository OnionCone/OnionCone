class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @detail = @order.order_details
  end

  def update
  end

end
