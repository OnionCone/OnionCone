class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  validates :postal_code, :address, :name, presence:true

  enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
  enum status: {"入金待ち": 0, "入金確認": 1, "製作中": 2 , "発送準備中": 3, "発送済み": 4}

  def full_name
    self.last_name + " " + self.first_name
  end
end