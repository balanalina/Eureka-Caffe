class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  before_destroy :not_referenced_by_any_cart_item

  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, "Cart items present")
      throw :abort
    end
  end
end
