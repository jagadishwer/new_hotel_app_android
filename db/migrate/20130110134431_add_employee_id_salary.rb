class AddEmployeeIdSalary < ActiveRecord::Migration
  def up
    add_column :salaries, :employee_id, :integer
  end

  def down
    remove_column :salaries, :employee_id
  end
end
