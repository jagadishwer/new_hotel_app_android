class CreateSwipeCards < ActiveRecord::Migration
  def change
    create_table :swipe_cards do |t|
      t.string :card_no
      t.float :balance

      t.timestamps
    end
  end
end
