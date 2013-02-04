class AddCounterIdToOrderlist < ActiveRecord::Migration
  def change
    add_column :orderlists, :counter_id, :integer
  end
end
