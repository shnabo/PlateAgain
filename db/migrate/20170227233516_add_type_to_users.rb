class AddTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_provider, :boolean
  end
end
