class Address < ApplicationRecord
  belongs_to :customer
  
  def address_all
    "〒" + postal_code + " " + address + " " + name
  end
end
