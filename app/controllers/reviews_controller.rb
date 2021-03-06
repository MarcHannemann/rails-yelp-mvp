class ReviewsController < ApplicationController
  def find
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    find
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    find
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
