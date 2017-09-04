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

  def review_params
    params.require(:review).permit(
    	:description,
    	:rating,
    )
  end


end
