class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

  def subtotal
    self.proce * self.amount
  end

  def auto_update
    if self.making_status == "製作中"
      self.order.update(status: "製作中")
    end
  end

  def complete_auto_update
    order_details = self.order.order_details
    making_status = order_details.pluck(:making_status)
     if making_status.all?{ |making_status| making_status == "製作完了"}
       self.order.update(status: "発送準備中")
     end
  end
end