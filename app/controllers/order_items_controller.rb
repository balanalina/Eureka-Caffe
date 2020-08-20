class OrderItemsController < ApplicationController
  before_action :set_order_item, only: :show

  def show ;end

  private

  def set_order_item
    @order_item = CartItem.find(params[:id])
  end
end
