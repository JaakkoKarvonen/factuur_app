class CreateInvoices < ActiveRecord::Migration
  def change
  	drop_table :invoices
    create_table :invoices do |t|
      t.belongs_to :contact
      t.belongs_to :product
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
