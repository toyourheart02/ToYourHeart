class AdminsController < ApplicationController
	# before_action :authenticate_admin!
	def top
	end

	def productindex

		@products = Product.all
	end

	def productdestroy
		@product = Product.find(params[:id])
		@product.is_deleted = true
		@product.save
		redirect_to  admins_products_path
	end









	def index
		@users = User.all.order(user_kana: "ASC")
	end

	def usershow
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user.id).reverse_order
		@orderproducts = OrderProduct.all
	end

	def useredit
		@user = User.find(params[:id])
	end

	def userupdate
    	user = User.find(params[:id])
	  	if user.update(user_params)
	      flash[:notice] = 'ユーザ情報が更新されました。'
	      redirect_to admins_usershow_path(user)
	    else
	      flash[:warning] = 'ユーザ情報の更新に失敗しました。'
	      render "admins/useredit"
    	end
    end

    # 退会処理：ユーザを論理削除させる 退会処理されたユーザはログインできなくする
    def userdestroy
    	user = User.find(params[:id])
    	user.is_deleted = true
    	user.save
    	redirect_to admins_path
    end


    private

	def user_params
		params.require(:user).permit(:user_name, :user_kana, :zip_code, :address, :phone_number, :profile_image)
	end
end
