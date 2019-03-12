class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references :user, foreign_key: true
      t.string :zip_code
      t.string :address
      t.string :friend_name

      t.timestamps
    end
  end
end
