class DestinationsController < ApplicationController
	# 配送先一覧はordersのnewアクションの中で取得
	# def index
	# end

	def create
		dest = Destination.new(dest_params)
		dest.user_id = current_user.id
		if dest.save
			# 成功したら非同期でメッセージ出す
			flash[:notice] = "新規配送先を登録しました。配送先を配送先タブより選択してください。"
			redirect_to new_order_path
		else
			# 失敗したら非同期でメッセージ出す
			flash[:warning] = "配送先登録に失敗しました。"
			render new_order_path
		end

	end

	def destory

	end


	private
	def dest_params
		params.require(:destination).permit(:friend_name, :zip_code, :address)
  	end
end
