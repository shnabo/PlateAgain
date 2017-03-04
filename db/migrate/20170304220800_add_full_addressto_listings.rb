class AddFullAddresstoListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :full_street_address, :string
  end
end
