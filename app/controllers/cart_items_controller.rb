class CartItemsController < ApplicationController
  include CartsHelper
  before_action :set_cart_item, only: %i[show edit update destroy]
  before_action :set_current_cart, only: %i[create destroy]

  def new
    @cart_item = CartItem.new
  end

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(product)
    if @cart_item.save
      redirect_to root_path
      flash[:success] = 'Item successfully added to the cart!'
    else
      redirect_to root_path
      flash[:fail] = 'Could not add the item to cart!'
    end
  end

  def destroy
    if @cart_item.quantity > 1
      @cart_item.decrement(:quantity).save!
    else
      @cart_item.destroy
    end
    redirect_to cart_path(@cart)
    flash[:success] = 'Item successfully removed!'
  end

  private

  def set_cart_item
    @cart_item = current_user.cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:product_id)
  end
end
