class ArtistsController < ApplicationController
	def create
		@artist = Artist.new(artist_params)

		presence_error = "can't be blank"
		uniqueness_error = "has already been taken"

		if @artist.save
			flash[:notice] = "アーティストが１件登録されました。"
			redirect_to master_new_path
		else

			if @artist.errors.messages[:artist_name].include?(presence_error) then
				flash[:warning] = "アーティスト名が空欄です。"
			elsif  @artist.errors.messages[:artist_name].include?(uniqueness_error) then
				flash[:warning] = "登録済みのアーティストです。"
			#エラーメッセージはそれぞれ {"artist_name"=>["can't be blank", "has already been taken"]}
			end
			# ここの記述がないとインスタンスがnilになるエラーが発生。原因が解決したら、この部分は削除
			# ////////////////
			@label = Label.new
			# ////////////////
			redirect_to master_new_path
		end
	end

	private

	def artist_params
			params.require(:artist).permit(:artist_name,:artist_kana)
	end
end
