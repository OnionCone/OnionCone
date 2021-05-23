class Admin::HomesController < ApplicationController
  def top
  end

  def index
    @orders = Order.all
    @order = Order.new
  end
end
