class AddKitchenIdToOrderlist < ActiveRecord::Migration
  def change
    add_column :orderlists, :kitchen_id, :integer
  end
end
