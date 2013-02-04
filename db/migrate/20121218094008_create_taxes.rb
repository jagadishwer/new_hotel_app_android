class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :name
      t.float :percentage
      

      t.timestamps
    end
    remove_column :users, :tax
  end
end
