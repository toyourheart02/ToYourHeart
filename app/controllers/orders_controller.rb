class OrdersController < ApplicationController
	def new
		@order = Order.new
		# 新規配送先登録用
		@dest = Destination.new
		
		# そのユーザの配送先を全件取得
		user = current_user
		@dests = user.destinations

		# binding.pry
		# select_tagのデフォルト値に使用。ユーザの配送先の１件目を指定
    	# dest_first = @dests.first.id
    	# select_tagから現在選択されているクラスのid取得
    	# 未選択時はデフォルトのclass_first
    	# binding.pry
  #   	dest_id = 6
  #   	@dest_id = params[dest_id] || dest_first
		# # 表示する配送先を１件
		# dest = @dests.find(@dest_id)
	end

	# order, order_productsテーブルに追加。cartテーブルからは削除
	def create
		# 注文登録処理
		order = Order.new(order_params)
		# orderテーブルの各カラムに情報を格納
		order.user_id = current_user.id
		#配送先は仮で1番目が選ばれる
		dests = current_user.destinations
	    order.destination_id = dests[0].id
	    # payはフォームから取得済み
	    order.save

	    # 注文済み商品登録処理
	    # 現在のユーザのカート内レコードを取得
	    cart = Cart.where(user_id: current_user.id)
	    #取得したカートのレコード一件ごとに処理する。注文数と在庫数を比較
	    cart.each do |cart|
	    	# 商品の在庫数と注文数を比較して注文可能なら処理を行う。
		     if cart.product.stock > cart.quantity

		     	orderproduct = OrderProduct.new
		     	orderproduct.product_id = cart.product_id
		     	orderproduct.quantity = cart.quantity
		     	orderproduct.price = cart.product.price
		     	orderproduct.order_id = order.id

		     	# 在庫数を更新(注文数を引く)
		     	cart.product.stock -= cart.quantity
		     	cart.product.save

				# 注文商品を登録
				orderproduct.save

		     	# 登録が成功した商品はカートから削除（在庫の関係で注文エラーになったものはカートに残す）
	     		cart.destroy
	     		flash[:notice] = "商品の購入が完了しました。購入履歴ページで確認してください。"
	     		# 商品の在庫数と注文数を比較して注文不可なら。warningにメッセージを入れておく
	     	else
	     		flash[:warning] = "購入できなかった商品があります。在庫数を確認して注文個数を変更してください。"
	     	end
	    end
	    redirect_to carts_path
	end

	private
	def order_params
		params.require(:order).permit(:pay)
	end
end
