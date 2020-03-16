class ProductsController < ApplicationController
  before_action :find_product, except: %i[index new create]
  before_action :authenticate_merchandiser!, except: %i[index show]

  def index
    @products = Product.filter_by_category(params[:category])
  end

  def show
    recent_view_update
  end

  def new
    @product = current_merchandiser.products.build
    @product.product_items.new
  end

  def create
    @product = current_merchandiser.products.build(product_params)
    @product.category_id = product_params[:category_id]

    if @product.save
      redirect_to @product, notice: 'Successfully created new product'
    else
      render :new
    end
  end

  def edit
    @product.product_items.new
  end

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
    params.require(:product).permit(:title, :price, :shipping_fee, :category_id, :image,
      product_items_attributes: %i[id title price total_amount image _destroy])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def recent_view_update
    rv = current_customer.recent_views.find_or_create_by(product_id: @product.id)
    rv.updated_at = DateTime.now
    rv.save!
  end
end
