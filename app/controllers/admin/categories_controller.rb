class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

end
