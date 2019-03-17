class CartsController < ApplicationController
  def index
  	# 現在ログイン中のユーザのカート内
  	# @carts = Cart.where(user_id: current_user.id)
  	# @carts = current_user.products
  	@products = current_user.products
  end

  def create
  	cart = Cart.new
  	# user_idはcurrent_userのidを代入
  	cart.user_id = current_user.id
  	#product_idはクリックされた商品のproduct_idを代入
  	cart.product = Product.find(params[:product_id])
  	cart.save
  	# 他の画面でも使用できるようにリダイレクトは非同期処理にしたい。（それぞれの画面のまま）
  	redirect_to products_path
  end

# カート内の商品を削除するアクション
  def destroy
  	# 削除したい商品を特定
  	user = current_user
  	product = Product.find(params[:id])
  	# cartsテーブル内で削除するカラムを指定(１件取得のためfind_by)
  	cart = user.carts.find_by(product_id: product.id)
	if cart.destroy
		flash[:notice] = "カート内商品を１件削除しました。"
		redirect_to carts_path
	end
  end
end
