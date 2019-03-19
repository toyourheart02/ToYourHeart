class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		# 退会したユーザは表示させない処理を追加する
		@users = User.all
	end

	#ユーザのマイページ用に作成。管理者からの機能は後ほど追加。
	def show
	  	@user = User.find(params[:id])
  	end

    def edit
    	@user = User.find(params[:id])

    end

    def update

    	user = User.find(params[:id])
	  	if user.update(user_params)
	      flash[:notice] = 'ユーザ情報が更新されました。'
	      redirect_to user_path(user.id)
	    else
	      flash[:warning] = 'ユーザ情報の更新に失敗しました。'
	      redirect_to edit_user_path(user.id)
    	end
    end

    # 退会処理　論理削除
    def destroy
    	user = User.find(params[:id])
    	user.is_deleted = true
    	user.save
    	# ログアウトさせる
    	# redirect_to :controller => 'devise/sessions', :action => 'destroy'
    	redirect_to destroy_user_session_path
    end


    private

	def user_params
		params.require(:user).permit(:user_name, :user_kana, :zip_code, :address, :phone_number, :profile_image)
	end
end
