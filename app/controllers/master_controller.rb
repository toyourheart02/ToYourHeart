class MasterController < ApplicationController
  def new
  	@artist = Artist.new
  	@label = Label.new
  	@genre = Genre.new
  	@scene = Scene.new
  	@music = Music.new

  	# アーティスト一覧を５０音順で取得
  	@artists = Artist.all.order(:artist_kana)

  	# あ行のアーティスト取得(おそらくこの方法しかない)
  	@artists_a = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "あ%", "い%", "う%","え%", "お%")

  	# か行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ka = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "か%", "き%", "く%","け%", "こ%")

	# さ行のアーティスト取得(おそらくこの方法しかない)
  	@artists_sa = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "さ%", "し%", "す%","せ%", "ぞ%")

  	# た行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ta = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "た%", "ち%", "つ%","て%", "と%")

	# な行のアーティスト取得(おそらくこの方法しかない)
  	@artists_na = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "な%", "に%", "ぬ%","ね%", "の%")

	# は行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ha = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "は%", "ひ%", "ふ%","へ%", "ほ%")

  	# ま行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ma = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "ま%", "み%", "む%","め%", "も%")

	# や行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ya = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "ゆ%", "や%", "よ%")

  	# ら行のアーティスト取得(おそらくこの方法しかない)
  	@artists_ra = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "ら%", "り%", "る%","れ%", "ろ%")

  	# わ行のアーティスト取得(おそらくこの方法しかない)
  	@artists_wa = @artists.where('artist_kana LIKE ? OR artist_kana LIKE ? OR artist_kana LIKE ?', "わ%", "を%", "ん%")

  end
end
