class Admin::HomesController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).reverse_order
    @order = Order.new
  end
end