class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
t.integer :position_id
t.integer :branch_id
t.string :first_name
t.string :last_name
t.string :employee_no



      t.timestamps
    end
  end
end
