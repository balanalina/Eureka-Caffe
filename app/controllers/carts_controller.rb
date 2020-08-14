class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
  end


  def update
    @cart.update(cart_params)
  end

  def destroy
    CartItem.joins(:cart).where(carts: { id: @cart.id }).delete_all if @cart.id == session[:cart_id]
    redirect_to(@cart)
  end

  private

  def cart_params
    params.fetch(:cart, {})
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid carts #{params[:id]}"
    redirect_to root_path, notice: "That carts doesn't exist"
  end
end
