class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, :check_user, only: %i[show edit destroy]

  def show; end

  def destroy
    @cart.empty_cart
    redirect_to(@cart)
    flash[:success] = 'Your cart is empty!'
  end

  private

    def set_cart
      @cart = current_user.cart
    end

    def invalid_cart
      logger.error "Attempt to access invalid carts #{params[:user_id]}"
      redirect_to root_path, notice: "That carts doesn't exist"
    end

  def check_user
    unless current_user.admin? || @cart == Cart.find(params[:id])
      redirect_to root_url
      flash[:success] = "You can't access this cart!"
    end
  end
end
