class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update show]

  def new
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
