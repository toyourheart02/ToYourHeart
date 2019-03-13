class ScenesController < ApplicationController
	def create
		@scene = Scene.new(scene_params)
		presence_error = "can't be blank"
		uniqueness_error = "has already been taken"

		if @scene.save
			flash[:notice] = "シーンが１件登録されました。"
			redirect_to master_new_path
		else
			if @scene.errors.messages[:scene_name].include?(presence_error) then
				flash[:warning] = "シーン名が空欄です。"
			elsif  @scene.errors.messages[:scene_name].include?(uniqueness_error) then
				flash[:warning] = "登録済みのシーンです。"
			#エラーメッセージはそれぞれ {"scene_name"=>["can't be blank", "has already been taken"]}
			end
			redirect_to master_new_path
		end
	end

	private

	def scene_params
			params.require(:scene).permit(:scene_name)
	end
end
