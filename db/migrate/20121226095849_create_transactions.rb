class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
t.integer :swipe_card_id
t.string :counter_id
t.float :cost
t.integer :type_of_transaction
      t.timestamps
    end
  end
end
