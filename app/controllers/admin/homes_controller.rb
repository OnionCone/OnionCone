class Admin::HomesController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end
end