class AddTragetMothYearToSalaryAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :target_year, :integer
    add_column :salaries, :target_year, :integer
    add_column :attendances, :target_month, :integer
    add_column :salaries, :target_month, :integer

  end
end
