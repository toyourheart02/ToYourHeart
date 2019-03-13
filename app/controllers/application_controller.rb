class ApplicationController < ActionController::Base
	# before_action :authenticate_admin!


	private

     # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
     # adminならこちらへ遷移
      if resource_or_scope.is_a?(Admin)
      	# flash[:notice] = "adminでログインしました。"
        admins_path
     # 一般userならこちらへ遷移
      elsif resource_or_scope.is_a?(User)
      	# flash[:notice] = "一般ユーザでログインしました。"
        products_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
      	new_admin_session_path
      elsif resource_or_scope == :user
      	new_user_session_path
      end
    end
end
