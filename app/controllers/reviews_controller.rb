class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    # if no product escape from method, redirect
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: "Review Successful"
    else
      redirect_to @product, notice: "Review Error"
    end

  end

  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy!
    end
    redirect_to product_path(params[:product_id])
  end
  
  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
