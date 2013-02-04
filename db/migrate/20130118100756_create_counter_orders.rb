class CreateCounterOrders < ActiveRecord::Migration
  def change
    create_table :counter_orders do |t|
t.integer :counter_id
t.integer :item_id
t.integer :quantity
t.integer :status
t.integer :user_id
      t.timestamps
    end
  end
end
