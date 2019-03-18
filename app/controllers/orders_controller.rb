class OrdersController < ApplicationController
	def new
		@order = Order.new
		@dest = Destination.new

		user = current_user
		# そのユーザの配送先を全件取得
		@dests = user.destinations		
	end

	def create
		order = Order.new
		# Orderテーブル登録後はOrders_productテーブル登録のアクションへ
		redirect_to order_products_path
	end
end
