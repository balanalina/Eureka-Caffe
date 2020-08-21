class OrdersController < ApplicationController
  before_action :order_params, only: %i[create]
  before_action :set_current_cart, only: :create
  before_action :check_user, only: :show

  def index
    @orders = current_user.orders.paginate(page: params[:page])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @cart.cart_items.each do |item|
      @order.order_items << OrderItem.new(product_id: item.product.id, quantity: item.quantity,
                                          fix_price: item.product.price)
    end
    if @order.save
      @cart.empty_cart
      redirect_to root_url
      flash[:success] = 'Order created!'
    else
      redirect_to root_url
      flash[:danger] = 'Could not create order!'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def order_params
      params.require(:order).permit(:address, :phone_number)
    end

    def set_current_cart
      @cart = current_user.cart
    end

  def check_user
    unless current_user.admin? || current_user.id == Order.find(params[:id]).user.id
      redirect_to root_url
      flash[:success] = "You can't access this order!"
    end
  end
end
