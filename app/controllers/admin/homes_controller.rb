class Admin::HomesController < ApplicationController
  def index
    @orders = Order.all
    @order = Order.new
  end
end
