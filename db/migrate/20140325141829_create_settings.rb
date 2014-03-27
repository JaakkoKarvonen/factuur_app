class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :currency
      t.integer :term
      t.integer :btw
      
      t.timestamps
    end
  end
end
