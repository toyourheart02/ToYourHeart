class LabelsController < ApplicationController
	def create
		@label = Label.new(label_params)
		presence_error = "can't be blank"
		uniqueness_error = "has already been taken"

		if @label.save
			flash[:notice] = "レーベルが１件登録されました。"
			redirect_to master_new_path
		else
			if @label.errors.messages[:label_name].include?(presence_error) then
				flash[:warning] = "レーベル名が空欄です。"
			elsif  @label.errors.messages[:label_name].include?(uniqueness_error) then
				flash[:warning] = "登録済みのレーベルです。"
			#エラーメッセージはそれぞれ {"label_name"=>["can't be blank", "has already been taken"]}
			end
			redirect_to master_new_path
		end
	end

	private

	def label_params
			params.require(:label).permit(:label_name)
	end
end
