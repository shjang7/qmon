class PurchasesController < ApplicationController
  before_action :find_purchase, except: %i[index create]
  before_action :remove_unconfirmed, only: :create
  before_action :authenticate_customer!

  def index
    @purchases = current_customer.purchases
  end

  def create
    @purchase = current_customer.purchases.build(purchase_params)
    @purchase.price = purchase_price(purchase_params[:orders_attributes].values())

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
    @purchase.confirmed = true
    @purchase.purchase_number = "#{Time.now.to_i}#{@purchase.id}"
    if @purchase.update(purchase_params)
      redirect_to complete_purchase_path(id: @purchase.id)
    else
      @purchase.confirmed = false
      render 'edit'
    end
  end

  def show
  end

  def complete
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item_list,
      :shipping_fee, :recipient_name, :recipient_contact, :recipient_address,
      orders_attributes: %i[id title quantity product_id product_item_id _destroy])
  end

  def find_purchase
    unless Purchase.find_by_id(params[:id]).exists?
      flash[:alert] = 'No info'
      redirect_back(fallback_location: root_path)
    else
      @purchase = Purchase.find(params[:id])
    end
  end

  def remove_unconfirmed
    Purchase.unconfirmed_destroy(current_customer)
  end

  def purchase_price(orders)
    orders.sum do |order|
      quantity, product_id, product_item_id = order.values_at(:quantity, :product_id, :product_item_id)
      each_price = ProductItem.find(product_item_id).price
      quantity.to_i * each_price
    end
  end
end
