class MasterController < ApplicationController
  def new
  	@artist = Artist.new
  	@label = Label.new
  	@genre = Genre.new
  	@scene = Scene.new
  	@music = Music.new

  	# アーティスト一覧を５０音順で取得
  	@artists = Artist.all.order(:artist_kana)
  end
end
