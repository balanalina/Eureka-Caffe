class Admin::ProductsController < AdminController
  before_action :set_product, only: [:destroy]
  def destroy
    if @product.destroy
      redirect_to root_url
      flash[:success] = 'Product successfully removed!'
    else
      redirect_to root_url
      flash[:danger] = "This product is referenced by cart_items!"
    end
  end

  private

  def product_params
    params.require(:id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
