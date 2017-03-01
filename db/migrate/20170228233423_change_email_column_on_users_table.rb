class ChangeEmailColumnOnUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, null:false
  end
end
