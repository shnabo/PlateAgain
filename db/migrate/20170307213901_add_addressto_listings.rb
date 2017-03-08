class AddAddresstoListings < ActiveRecord::Migration[5.0]
  def change
  add_column :listings, :add_number, :string
  add_column :listings, :add_name, :string
  add_column :listings, :add_type, :string
  add_column :listings, :your_city, :string
  add_column :listings, :postal, :string
  end
end
