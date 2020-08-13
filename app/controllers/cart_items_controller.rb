class CartItemsController < ApplicationController
  include CurrentCart
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
        format.html { redirect_to home_path, notice: 'Item added to cart.' }
        end
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
    end
  end

  def update
    # code here
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:product_id)
  end
end
