class AddMusicKanaToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :music_kana, :string
  end
end
