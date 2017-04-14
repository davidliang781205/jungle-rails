class ReviewsController < ApplicationController
  before_action :logged_in

  def create
    @review = Review.new(product_id: params[:product_id], user_id: current_user.id, rating: params[:rating], description: params[:description])
    if @review.save!
      redirect_to "/products/#{params[:product_id]}/"
    else
      flash[:error] = 'Review Error'
      redirect_to "/products/#{params[:product_id]}/"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}/"
  end

  private

  def logged_in
    if(current_user.nil?)
      flash[:error] = 'Please login'
      redirect_to "/products/#{params[:product_id]}/"
    end
  end

  def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end
end
