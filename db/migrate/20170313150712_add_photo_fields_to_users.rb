class AddPhotoFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_cache, :string
    add_column :users, :remote_photo_url, :string
  end
end
