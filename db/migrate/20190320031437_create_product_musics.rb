class CreateProductMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :product_musics do |t|
      t.references :product, foreign_key: true
      t.integer :disc_num
      t.integer :track_num
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
