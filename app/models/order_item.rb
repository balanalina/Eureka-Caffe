class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def total_price
    product.price.to_i * quantity.to_i
  end
end
