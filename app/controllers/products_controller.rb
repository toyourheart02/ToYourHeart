class ProductsController < ApplicationController
	def index
  	# config/initializers/kaminari_configで1ページの表示件数20件に設定
		@products = Product.page(params[:page]).reverse_order
	end


	def new
		@product = Product.new
	end

	def create
		 # ストロングパラメーターを使用
         product = Product.new(product_params)
        # DBへ保存する
         if product.save!
         	flash[:notice] = "商品が1件登録されました。"
         	redirect_to products_new_path
         else 
         	flash[:warning] = "商品の登録に失敗しました。。"
         	redirect_to products_new_path
         end
	end


	 private
   
    def product_params
        params.require(:product).permit(:music_image, :title, :price, :label_id, :genre_id, :scene_id, :release_date, :stock, :artist_name)
    end


end
