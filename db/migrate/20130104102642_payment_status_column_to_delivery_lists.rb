class PaymentStatusColumnToDeliveryLists < ActiveRecord::Migration
  def up
    add_column :delivery_items, :payment_status, :integer
  end

  def down
    remove_column :delivery_items, :payment_status
  end
end
