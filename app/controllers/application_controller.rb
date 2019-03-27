class ApplicationController < ActionController::Base
	# before_action :authenticate_admin!

  # 任意の項目をユーザ登録するため
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    #strong parametersを設定し、user_name, user_kanaを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :user_kana, :email, :password, :password_confirmation) }
    # devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end

	private

     # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
     # adminならこちらへ遷移
      if resource_or_scope.is_a?(Admin)
      	# flash[:notice] = "adminでログインしました。"
        admins_top_path
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
