class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.string :scene_name

      t.timestamps
    end
  end
end
