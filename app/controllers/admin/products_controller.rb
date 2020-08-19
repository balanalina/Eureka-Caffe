class Admin::ProductsController < AdminController
  before_action :set_product, only: %i[edit update destroy]
  before_action
  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product edited!'
      redirect_to root_url
    else
      flash[:danger] = 'Could not update product!'
      render 'edit'
    end
  end

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
    params.require(:product).permit(:title, :category, :price, :image)
  end

  def update_params

  end

  def set_product
    @product = Product.find(params[:id])
  end
end
