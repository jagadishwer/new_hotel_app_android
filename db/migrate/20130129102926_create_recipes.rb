class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :item_id
      t.integer :stock_list_item_id
      t.float :quantity
      t.timestamps
    end
  end
end
