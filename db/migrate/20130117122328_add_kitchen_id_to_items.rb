class AddKitchenIdToItems < ActiveRecord::Migration
  def change
         add_column :items, :kitchen_id, :integer
  end
end
