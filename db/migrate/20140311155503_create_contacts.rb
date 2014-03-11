class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.integer :kvk
      t.string :btw
      t.string :email
      t.string :account

      t.timestamps
    end
  end
end
