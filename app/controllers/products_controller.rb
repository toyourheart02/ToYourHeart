class ProductsController < ApplicationController
	def index
  	# config/initializers/kaminari_configで1ページの表示件数20件に設定
        @products = Product.page(params[:page]).reverse_order
	end

    def sort
        sortValue = params["sortValue"]

        if sortValue == "price_desc"
            products = Product.all.order(price: "DESC")
        elsif sortValue == "price_asc"
            products = Product.all.order(price: "ASC")
        elsif sortValue == "review_score"
            products = Product.all.includes(:review).order("reviews.score desc")
        else
            products = Product.page(params[:page]).reverse_order
        end



        render json: products
    end

    def show
        @product = Product.find(params[:id])
        @review = Review.new
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
         	redirect_to new_product_music_path(product)
         else
         	flash[:warning] = "商品の登録に失敗しました。。"
         	redirect_to products_new_path
         end
	end

     def edit
        @product = Product.find(params[:id])

    end

    def update
        # binding.pry
        product = Product.find(params[:id])
        if product.update(product_params)
          flash[:notice] = '商品情報が更新されました。'
          redirect_to product_path(product.id)
        else
          flash[:warning] = '商品情報の更新に失敗しました。'
          redirect_to product_path(product.id)
        end
    end


	 private

    def product_params
        params.require(:product).permit(:music_image, :title, :price, :label_id, :genre_id, :scene_id, :release_date, :stock, :artist_id)
    end


end
