class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Successfully created new product'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
