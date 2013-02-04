class ChangeCcounterIdToKitchenIdInternalOrder < ActiveRecord::Migration
  def up
    rename_column :internal_orders, :counter_id, :kitchen_id
  end

  def down
       rename_column :internal_orders, :kitchen_id, :counter_id
  end
end
