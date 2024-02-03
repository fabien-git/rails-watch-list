class ReviewsController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @Review = Review.new
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
