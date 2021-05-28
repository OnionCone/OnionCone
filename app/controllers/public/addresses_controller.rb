class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address = Address.new
    @addresses = Address.all
    @customer = current_customer
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
    redirect_to addresses_path
    else
      redirect_to  addresses_path
    end
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    addresses = Address.find(params[:id])
    if addresses.update(address_params)
    redirect_to addresses_path
    else
      redirect_to  addresses_path
    end
  end

  def destroy
    addresses = Address.find(params[:id])
    addresses.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address, :name, :postal_code, :customer_id)
  end

  def address_params
    params.require(:address).permit(:address, :name, :postal_code, :customer_id)
  end
end
