class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.price * amount
  end

  def subtotal_all
    # puts price * 1.08
    Item.sum(:price) * CartItem.sum(:amount)
  end
end