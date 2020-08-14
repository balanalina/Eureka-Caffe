class CartItemsController < ApplicationController
  include CartsHelper
  before_action :set_cart_item, only: %i[show edit update destroy]
  before_action :set_current_cart, only: :create

  def index
    @cart_items = CartItem.all
  end

  def show; end

  def new
    @cart_item = CartItem.new
  end

  def edit; end

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(product)
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to root_path, notice: 'Item successfully added to the cart!' }
      else
        format.html { redirect_to root_path, notice: 'Could not add the item to cart!' }
      end
    end
  end

  def destroy
    @cart = current_user.cart
    if @cart_item.quantity > 1
      @cart_item.decrement(:quantity).save!
    else
      @cart_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
    end
  end

  private

  def set_cart_item
    @cart_item = current_user.cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:product_id)
  end
end
