class AddCounterIdToCustomers < ActiveRecord::Migration
  def change
    add_column :orders, :counter_id, :integer
    add_column :customers, :counter_id, :integer
  end
end
