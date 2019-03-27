class GenresController < ApplicationController
	def create
		@genre = Genre.new(genre_params)
		presence_error = "can't be blank"
		uniqueness_error = "has already been taken"

		if @genre.save
			flash[:notice] = "ジャンルが１件登録されました。"
			redirect_to master_new_path
		else
			if @genre.errors.messages[:genre_name].include?(presence_error) then
				flash[:warning] = "ジャンル名が空欄です。"
			elsif  @genre.errors.messages[:genre_name].include?(uniqueness_error) then
				flash[:warning] = "登録済みのジャンルです。"
			#エラーメッセージはそれぞれ {"genre_name"=>["can't be blank", "has already been taken"]}
			end
			redirect_to master_new_path
		end
	end

	private

	def genre_params
			params.require(:genre).permit(:genre_name)
	end
end
