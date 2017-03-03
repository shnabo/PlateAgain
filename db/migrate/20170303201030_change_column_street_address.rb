class ChangeColumnStreetAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :address, :full_street_address
  end
end
