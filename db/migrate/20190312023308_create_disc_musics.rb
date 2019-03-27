class CreateDiscMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_musics do |t|
      t.references :disc, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
