class Customer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :postal_code, :address, :telephone_number, presence:true

  validates :last_name_kana, :first_name_kana,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   }
  validates :postal_code, :telephone_number,numericality: { only_integer: true}

  validates :email, uniqueness: true

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  # enum is_deleted: {Invalid: true, Valid: false}

  #退会後ログイン制限
  #def active_for_authentication?
   #super && (self.is_deleted == "Valid")
  #end
end