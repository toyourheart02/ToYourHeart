class CartsController < ApplicationController
  def index
  	# 現在ログイン中のユーザのカート内
  	# user = current_user
  	# 

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

  def destroy

  end

  
end
