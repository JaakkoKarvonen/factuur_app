class CreateProductFields < ActiveRecord::Migration
  def change
    create_table :product_fields do |t|
      t.string :product
      t.string :amount
      t.belongs_to :invoice, index: true

      t.timestamps
    end
  end
end
