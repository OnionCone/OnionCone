class OrderDetail < ApplicationRecord
  has_many :oreders, dependent: :destroy
  has_many :items, dependent: :destroy
end
