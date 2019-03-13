class AddArtistToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :artist, foreign_key: true
  end
end
