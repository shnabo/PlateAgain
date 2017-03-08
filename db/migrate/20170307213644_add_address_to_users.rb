class AddAddressToUsers < ActiveRecord::Migration[5.0]
  def change
  add_column :users, :add_number, :string
  add_column :users, :add_name, :string
  add_column :users, :add_type, :string
  add_column :users, :your_city, :string
  add_column :users, :postal, :string
  end
end
