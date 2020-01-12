class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :update]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    @review = Review.find_by(params[:id])
    render json: @review
  end

  def create
    @reivew = Review.create(review_params)
    render json: @review
  end

  def update
    @review.update(review_params)
  end

  private

  def set_reviews
    @review = Review.find_by(params[:id])
  end

  def review_params
    params.permit(:rating, :user_id, :product_id)
  end
end
