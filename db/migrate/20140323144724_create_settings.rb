class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :currency
      t.string :term
      t.string :conditions
      t.string :btw
      t.timestamps
    end
  end
end
