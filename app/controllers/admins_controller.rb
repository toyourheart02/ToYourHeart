class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def top
	end

	def index
		@users = User.all.order(user_kana: "ASC")
	end

	def usershow
		@user = User.find(params[:id])
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
	      render "useredit"
    	end
    end


    private

	def user_params
		params.require(:user).permit(:user_name, :user_kana, :zip_code, :address, :phone_number, :profile_image)
	end
end
