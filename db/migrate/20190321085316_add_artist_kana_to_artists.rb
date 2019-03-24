class AddArtistKanaToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :artist_kana, :string
  end
end
