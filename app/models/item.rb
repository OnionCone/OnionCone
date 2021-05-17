class Item < ApplicationRecord
  has_many :genres, dependent: :destroy
  belongs_to :cart_item
  belongs_to :order_detail
end
