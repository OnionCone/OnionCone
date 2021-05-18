class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def full_name(customer)
  "#{customer[:first_name]} #{customer[:last_name]}"
  end
end
