class MusicsController < ApplicationController
	def create
		@music = Music.new(music_params)

		if @music.save
			flash[:notice] = "楽曲が１件登録されました。"
			redirect_to master_new_path
		else
			flash[:warning] = "楽曲の登録に失敗しました。"
			render master_new_path
		end
	end

	private

	def music_params
			params.require(:music).permit(:music_name, :artist_id)
	end
end
