class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    temp = order_params
    temp[:status] = temp[:status].to_i
    @order.update(temp)
    if @order.status == "入金確認"
      @order.order_details.each do |d|
        d.update(making_status: "製作待ち")
      end
    end
    redirect_to admin_order_path(@order)
  end

    private

  def order_params
    params.require(:order).permit(:status)
  end
end

