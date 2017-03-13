class AddFieldsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :picture_cache, :string
    add_column :listings, :remote_picture_url, :string
  end
end
