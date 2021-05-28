class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.price * amount
  end

  validates :amount, presence: true

end