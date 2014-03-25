class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
    	t.date :date
      	t.integer :contact_id

      	t.timestamps
    end
  end
end
