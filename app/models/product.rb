class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_items, dependent: :destroy
  before_destroy :not_referenced_by_any_cart_item
  validates :title, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :image, presence: true, allow_blank: false

  private

    def not_referenced_by_any_cart_item
      unless cart_items.empty?
        errors.add(:base, 'Cart items present')
        throw :abort
      end
    end
end
