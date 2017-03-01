class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :donor_id, :user_id
  end
end
