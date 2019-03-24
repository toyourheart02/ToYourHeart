class AddKanaToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :kana, :string
  end
end
