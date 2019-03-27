class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.date :release_date
      t.references :scene, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :music_image_id
      t.references :label, foreign_key: true
      t.integer :stock
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
