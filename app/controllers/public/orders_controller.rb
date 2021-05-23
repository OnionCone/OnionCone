class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    #binding.pry
    @customer = current_customer
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      @order.customer_id = current_customer.id
    elsif params[:order][:address_option] = "1"

      @address_order = Address.find(params[:order][:address_for_order])
      @order.postal_code = @address_order.postal_code
      @order.address =  @address_order.address
      @order.name = @address_order.name
      @order.customer_id = current_customer.id
    end
  end

  def complete
  end

  def create
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

  def order_params
    params.require(:order).permit(:payment_method, :address)
  end

end
