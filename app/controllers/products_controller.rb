class ProductsController < ApplicationController
	def index
		# config/initializers/kaminari_configで1ページの表示件数20件に設定
		@products = Product.page(params[:page]).reverse_order
	end
end
