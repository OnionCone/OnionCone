class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @customer = current_customer
    @sub_total_product_price = 0
    @shipping_cost = 800
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.customer_id = current_customer.id
    elsif params[:order][:address_option] == "1"
      @address_order = Address.find(params[:order][:address_for_order])
      @order.postal_code = @address_order.postal_code
      @order.address =  @address_order.address
      @order.name = @address_order.name
      @order.customer_id = current_customer.id
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_confirm_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price * 1.1).floor
      @order_detail.save
    end
    #cart_item.destroy_all
    redirect_to complete_path

  end

  def index
    @order = current_customer.orders
  end

  def show
    @total = 0
    @order = Order.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def order_confirm_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name,
                                  :shipping_cost, :total_payment, :payment_method, :status)
  end


end
