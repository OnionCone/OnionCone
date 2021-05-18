class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to public_addresses_path
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    addresses = Address.find(params[:id])
    addresses.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    addresses = Address.find(params[:id])
    addresses.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address, :name, :postal_code)
  end
end
