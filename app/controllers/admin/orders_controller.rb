class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def update
  end

  def price_tax
    self.price * 1.1
  end


end
