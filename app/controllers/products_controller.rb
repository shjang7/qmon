class ProductsController < ApplicationController
  before_action :find_product, except: %i[index new create]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = product_params[:category_id]

    if @product.save
      redirect_to @product, notice: 'Successfully created new product'
    else
      render :new
    end
  end

  def edit; end

  def update
    @product.category_id = product_params[:category_id]
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: 'Successfully deleted product'
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :shipping_fee, :category_id, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
