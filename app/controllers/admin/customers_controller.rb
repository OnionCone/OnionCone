class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def full_name(customer)
  "#{customer[:first_name]} #{customer[:last_name]}"
  end
end
