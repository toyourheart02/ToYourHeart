class CartsController < ApplicationController
  def index
  	# 現在ログイン中のユーザのカート内表示
  	@products = current_user.products
  end

  # カートに商品を追加
  def create
  	cart = Cart.new
  	user = current_user

  	# user_idはcurrent_userのidを代入
  	cart.user_id = current_user.id
  	#product_idはクリックされた商品のproduct_idを代入
  	cart.product = Product.find(params[:product_id])

  	# カート内にuser, productの組み合わせを検索して変数へ代入
  	added_cart = user.carts.find_by(product_id: cart.product.id)
  	# 存在しなければ新たにカートに追加
  	if  added_cart == nil
  		cart.save
  	# 存在する場合は、quantityを＋１する
  	else
  		added_cart.quantity += 1
  		added_cart.save
  	end
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

# 個数変更
  def update
	cart =  Cart.find(params[:id])
	cart.update(cart_params)
	flash[:notice] = "個数を変更しました。"
	redirect_to carts_path
  end


  def cart_params
	params.require(:cart).permit(:quantity)
  end
end