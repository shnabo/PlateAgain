class ChangeEmailColumnOnUsersTable < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :email, :string, null:false
  end

  def down
  end
end
