class Order < ApplicationRecord
  before_create :create_qr_token
  belongs_to :user
  has_many :order_items

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end

  def create_qr_token
    self.qr_token = User.new_token
  end
end
