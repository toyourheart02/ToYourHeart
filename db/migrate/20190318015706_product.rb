class Product < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :is_deleted, :boolean, default: false
  end
end
