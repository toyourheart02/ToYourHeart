class ProductsController < ApplicationController
	def index
		# config/initializers/kaminari_configで1ページの表示件数20件に設定
		@products = Product.page(params[:page]).reverse_order
		# 新着10点の画像をスライドショーで表示
		@product_topten = Product.limit(10).order('release_date')
	end

	def search

	end

end
