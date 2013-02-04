class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.string :name
      

      t.timestamps
    end
    add_column :items, :counter_id, :integer
  end
end
