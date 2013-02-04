class CreateInternalOrders < ActiveRecord::Migration
  def change
    create_table :internal_orders do |t|
t.integer :counter_id
t.integer :stock_list_item_id
t.integer :quantity
t.integer :status
t.integer :user_id
      t.timestamps
    end
  end
end
