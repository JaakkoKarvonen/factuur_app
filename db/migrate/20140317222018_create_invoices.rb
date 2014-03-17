class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :contactid
      t.date :date
      t.integer :productid
      t.integer :amount

      t.timestamps
    end
  end
end
