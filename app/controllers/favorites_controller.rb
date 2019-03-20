class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.where(user_id: current_user.id)
		@products = []
		@favorites.each do |fav|
			@products.push(Product.find(fav.product_id))
		end
	end

    def create
        product = Product.find(params[:product_id])
        favorite = current_user.favorites.new(product_id: product.id)
        added_favorite = current_user.favorites.find_by(product_id: favorite.product.id)
  		# 存在しなければ新たにお気に入りに追加
  		if  added_favorite == nil
  			favorite.save
  		else
  		end
    end

	def destroy
        product = Product.find(params[:id])
        favorite = current_user.favorites.find_by(product_id: product.id)
        favorite.destroy
        redirect_to favorites_path
    end
end
