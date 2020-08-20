class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def total_price
    fix_price.to_i * quantity.to_i
  end
end
