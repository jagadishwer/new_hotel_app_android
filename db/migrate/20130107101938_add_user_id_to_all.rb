class AddUserIdToAll < ActiveRecord::Migration
  def change
    add_column :delivery_items, :user_id, :integer
    add_column :orderlists, :user_id, :integer
    add_column :paid_outs, :user_id, :integer
    add_column :remaining_items, :user_id, :integer
    add_column :swipe_cards, :user_id, :integer
    add_column :transactions, :user_id, :integer

  end
end
