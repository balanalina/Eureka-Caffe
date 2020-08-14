module CartsHelper
  include SessionsHelper
  private

  def set_current_cart
    if logged_in?
      @cart = current_user.cart
      if @cart.nil?
        @cart = Cart.create(user_id: current_user.id)
      end
    end
  end
end

