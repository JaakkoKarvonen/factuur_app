class CreateSettings < ActiveRecord::Migration
  def change

    create_table :settings do |t|
      t.string :currency
      t.integer :term
      t.integer :btw
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
