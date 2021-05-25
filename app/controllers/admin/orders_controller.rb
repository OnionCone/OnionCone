class Admin::OrdersController < ApplicationController
  def show
    @order = Order.all
    @total = 0
  end

  def update
  end
end
