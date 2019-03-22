class ProductMusicsController < ApplicationController
	def new
		@product = Product.find(params[:id])
		@product_music = ProductMusic.new
	end

	def create
		product = Product.find(params[:id])
		product_music = ProductMusic.new(product_music_params)
		produt_music.product_id = product.id
		product_music.save
		flash[:notice] = "商品が1件登録されました。"
		redirect_to products_new_path and return
	end
			# else
			# 	render 'new'
			# end
	# end

	private

	def product_music_params
		params.require(:product_music).permit(:product_id, :disc_num, :track_num, :music_id)
	end
end
