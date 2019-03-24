class ProductMusicsController < ApplicationController
	def new
		@product = Product.find(params[:id])
		2.times {@product.product_musics.build}
		# @product_music = ProductMusic.new
	end
end
