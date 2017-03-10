class RenameListingIdInComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :listing_id, :reviewer_id
  end
end
