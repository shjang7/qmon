class PurchasesController < ApplicationController
  before_action :find_purchase, except: %i[create]
  before_action :authenticate_customer!

  def create
    @purchase = current_customer.purchases.build(purchase_params)
    # @purchase.purchase_number = 10000000000 - current_customer.id -
    @purchase.shipping_fee = purchase_params[:shipping_fee]
    orders = purchase_params[:orders_attributes].values()
    orders.each do |order|
      quantity, product_id, product_item_id = order.values_at(:quantity, :product_id, :product_item_id)
      each_price = ProductItem.find(product_item_id).price
      @purchase.price = quantity.to_i * each_price
    end

    unless @purchase.orders.empty?
      @purchase.save(:validate => false)
      redirect_to edit_purchase_path(id: @purchase.id)
    else
      flash[:alert] = 'You cannot order empty products'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    @purchase.confirmed = true if @purchase.valid?
    if @purchase.save
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def purchase_params
    params.require(:purchase).permit(:shipping_fee, orders_attributes: %i[id title quantity product_id product_item_id _destroy])
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end
end
