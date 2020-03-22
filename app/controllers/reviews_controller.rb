class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update show]
  before_action :authenticate_customer!, except: :show

  def new
    @review = current_customer.reviews.build
  end

  def create
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

  def find_review
    @review = Review.find(params[:id])
  end
end
