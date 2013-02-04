class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :email
      t.text :address
      t.string :phone_no
      t.string :fax_no

      t.timestamps
    end
  end
end
