class Order < ApplicationRecord
  has_secure_token :qr_token
  belongs_to :user
  has_many :order_items

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
end
