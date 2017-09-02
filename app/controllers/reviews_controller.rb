class ReviewsController < ApplicationController
    
    before_action :require_login
 
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

    private
 
    def require_login
        unless @current_user
            flash[:error] = "You must be logged in to access this section"
            redirect_to '/signup' 
        end
    end



end
