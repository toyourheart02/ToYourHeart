class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :music_name
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
