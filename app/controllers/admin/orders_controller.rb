class Admin::OrdersController < AdminController
  def index
    @orders = Order.paginate(page: params[:page])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attribute(:confirmation, true)
    redirect_to root_url
    flash[:success] = 'Order confirmed!'
  end
end
