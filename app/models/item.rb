class Item < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  attachment :image
end
