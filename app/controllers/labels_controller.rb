class LabelsController < ApplicationController
	def create
		@label = Label.new(label_params)

		if @label.save
			flash[:notice] = "レーベルが１件登録されました。"
			redirect_to master_new_path
		else
			flash[:warning] = "レーベルの登録に失敗しました。"
			render master_new_path
		end
	end

	private

	def label_params
			params.require(:label).permit(:label_name)
	end
end
