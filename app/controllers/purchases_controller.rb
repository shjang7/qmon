class PurchasesController < ApplicationController
  before_action :find_purchase, except: %i[index create index_cart]
  before_action :remove_unconfirmed, only: :create
  before_action :authenticate_customer!

  def index
    @purchases = current_customer.bought_items
  end

  def create
    @purchase = current_customer.purchases.build(purchase_params)

    unless @purchase.orders.empty?
      @purchase.save(:validate => false)
      if saving_in_shopping_cart?
        @purchase.confirm_status = 1; @purchase.save(:validate => false)
        flash[:success] = 'Successfully saved in shopping cart'
        redirect_back(fallback_location: root_path)
        return
      end
      redirect_to edit_purchase_path(id: @purchase.id)
    else
      flash[:alert] = 'You cannot order empty products'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    @purchase.confirm_status = saving_in_shopping_cart? ? 1 : 2
    @purchase.created_at = Time.zone.now
    purchase_number = "#{Time.now.to_i}#{@purchase.id}"
    @purchase.purchase_number = purchase_number
    if @purchase.update(purchase_params)
      redirect_to purchase_complete_path
    else
      @purchase.confirmed = false
      render 'edit'
    end
  end

  def show
  end

  def index_cart
    @purchases = current_customer.shopping_cart_items
  end

  def complete
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item_list,
      :shipping_fee, :recipient_name, :recipient_contact, :recipient_address,
      orders_attributes: %i[id title quantity price product_id product_item_id _destroy])
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

  def proceeding_payment?
    params[:commit] == 'Proceed payment'
  end

  def saving_in_shopping_cart?
    params[:commit] == 'Save in Shopping Cart'
  end
end
