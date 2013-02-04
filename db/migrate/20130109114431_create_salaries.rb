class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
t.integer :working_days
t.float :basic_salary
t.float :travel_expense
t.float :other_expense
t.float :total_payable
t.float :day_rate
t.float :other_decuction
t.float :net_payable

      t.timestamps
    end
  end
end
