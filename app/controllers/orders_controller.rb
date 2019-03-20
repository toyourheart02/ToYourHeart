class OrdersController < ApplicationController
	def new
		@order = Order.new
		@dest = Destination.new
		user = current_user
		# そのユーザの配送先を全件取得
		@dests = user.destinations
	end

	# order, order_productsテーブルに追加。cartテーブルからは削除
	def create
		# 注文登録処理
		order = Order.new(order_params)
		binding.pry
		# orderテーブルの各カラムに情報を格納
		order.user_id = current_user.id
		#配送先は仮
		dests = current_user.destinations
	    order.destination_id = dests[0].id
	    # payはフォームから取得済み
	    order.save


	    # 注文済み商品登録処理
	    order_products = []

	    # @products.each do |product|
	    # 	OrderProduct.new
	    # end

	    # 現在のユーザのカート内レコードを取得
	    cart = Cart.where(user_id: current_user.id)


	    # カート内商品削除処理
	    #取得したレコードをすべて削除
	    cart.destroy_all(id > 0)
	end

	private
	def order_params
		params.require(:order).permit(:pay)
	end
end
