class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.references :imagable, :polymorphic => true

      t.timestamps
    end
    add_index :images, :imagable_id
  end
end
