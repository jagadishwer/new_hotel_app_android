class AddTotalAttendedAttendance < ActiveRecord::Migration
  def up
     add_column :attendances, :total, :integer
  end

  def down
    remove_column :attendances, :total
  end
end
