class Item < ApplicationRecord
  validates :is_deleted, inclusion: { in: [true, false]}

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  attachment :image
end
