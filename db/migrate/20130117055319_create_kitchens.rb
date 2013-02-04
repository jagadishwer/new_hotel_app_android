class CreateKitchens < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.string :name
      t.integer :counter_id
      t.text :description

      t.timestamps
    end
  end
end
