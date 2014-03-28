class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.string :email
      t.string :btw
      t.integer :kvk
      t.string :account
      t.integer :phone
      t.string :site
      t.belongs_to :user, index: true

      t.timestamps

    end
  end
end
