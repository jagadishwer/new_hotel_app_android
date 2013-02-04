class AddStatusToOrderlists < ActiveRecord::Migration
  def change
    add_column :orderlists, :status, :integer
  end
end
