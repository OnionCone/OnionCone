class Item < ApplicationRecord
  has_many :genres, dependent: :destroy
  belongs_to :cart_item, optional: true
  belongs_to :order_detail, optional: true

  attachment :image
end
