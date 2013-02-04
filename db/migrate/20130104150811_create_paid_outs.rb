class CreatePaidOuts < ActiveRecord::Migration
  def change
    create_table :paid_outs do |t|
      t.float :amount
      t.string :reason
      t.string :to

      t.timestamps
    end
  end
end
