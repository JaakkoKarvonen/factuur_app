class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.string :serial
      t.integer :price

      t.timestamps
    end
  end
end
