class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Catagory created!'
    else
      render :new
    end
  end

  # def destroy
  #   @category = Product.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :categories], notice: 'Category deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
