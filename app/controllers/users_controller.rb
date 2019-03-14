class UsersController < ApplicationController
	def index
		@users = User.all
	end

	#ユーザのマイページ用に作成。管理者からの機能は後ほど追加。
	def show
	  	# @user = current_user
	  	@user = User.find(params[:id])
  	end

    def edit
    	
    end

    def update
    	
    end
end
