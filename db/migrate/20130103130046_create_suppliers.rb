class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
     t.string :name
      t.string :description
      t.string :contact_name
      

      t.timestamps
    end
    add_column :delivery_items, :supplier_id, :integer
  end
end
