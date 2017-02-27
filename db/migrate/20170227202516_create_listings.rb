class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :item_name
      t.string :quantity
      t.boolean :perishable
      t.integer :donor_id
      t.date :expiry_date
      t.datetime :available_until
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :picture
      t.text :notes

      t.timestamps
    end
  end
end
