class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
      	t.string :description
      	t.string :serial
      	t.decimal :price, :precision => 8, :scale => 2
		t.belongs_to :user, index: true

      	t.timestamps
    end
  end
end