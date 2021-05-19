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
  
  # enum blood_type: { A: 0, B: 1, O: 2, AB: 3 }
end
