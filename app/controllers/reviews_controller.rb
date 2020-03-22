class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update show]
  before_action :authenticate_customer!, except: :show

  def new
    @review = current_customer.reviews.build
    @product_id = params[:product_id]
  end

  def create
    @review = current_customer.reviews.build(review_params)

    if @review.save
      redirect_to @review, notice: 'Successfully wrote new review'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @customer_reviews = current_customer.reviews.all
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :image, :product_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
