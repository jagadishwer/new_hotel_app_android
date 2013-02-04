class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
t.integer :employee_id
t.integer :salary_id
      t.boolean :day_1
      t.boolean :day_2
      t.boolean :day_3
      t.boolean :day_4
      t.boolean :day_5
      t.boolean :day_6
      t.boolean :day_7
      t.boolean :day_8
      t.boolean :day_9
      t.boolean :day_10
      t.boolean :day_11
      t.boolean :day_12
      t.boolean :day_13
      t.boolean :day_14
      t.boolean :day_15
      t.boolean :day_16
      t.boolean :day_17
      t.boolean :day_18
      t.boolean :day_19
      t.boolean :day_20
      t.boolean :day_21
      t.boolean :day_22
      t.boolean :day_23
      t.boolean :day_24
      t.boolean :day_25
      t.boolean :day_26
      t.boolean :day_27
      t.boolean :day_28
      t.boolean :day_29
      t.boolean :day_30
      t.boolean :day_31
      t.timestamps
    end
  end
end
