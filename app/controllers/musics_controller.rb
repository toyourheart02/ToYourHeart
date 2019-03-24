class MusicsController < ApplicationController
	def create
		@music = Music.new(music_params)
		presence_error = "can't be blank"
		uniqueness_error = "has already been taken"

		if @music.save
			flash[:notice] = "楽曲が１件登録されました。"
			redirect_to master_new_path
		else
			if @music.errors.messages[:music_name].include?(presence_error) && @music.errors.messages[:artist_id].include?(presence_error) then
				flash[:warning] = "楽曲名、アーティスト名が空欄です。"
			elsif @music.errors.messages[:music_name].include?(presence_error) then
				flash[:warning] = "楽曲名が空欄です。"
			elsif @music.errors.messages[:artist_id].include?(presence_error) then
				flash[:warning] = "アーティスト名が空欄です。"
			# 楽曲登録の際は、楽曲名とアーティストの組み合わせが重なった場合のみエラー
			elsif  @music.errors.messages[:music_name].include?(uniqueness_error) then
				flash[:warning] = "登録済みの楽曲です。"
			end
			redirect_to master_new_path
		end
	end

	private

	def music_params
			params.require(:music).permit(:music_name, :music_kana, :artist_id)
	end
end
