class ReviewsController < ApplicationController
	def create
		product = Product.find(params[:id])
		review = current_user.reviews.new(review_params)
		review.product_id = product.id
		if review.save
			flash[:notice] = "投稿が完了しました。"
			redirect_to products_show_path(product)
		else
			flash[:warning] = "投稿できませんでした。"
			redirect_to products_show_path(product)
		end
	end

	private

	def review_params
		params.require(:review).permit(:user_id, :product_id, :score, :title, :body)
	end
end