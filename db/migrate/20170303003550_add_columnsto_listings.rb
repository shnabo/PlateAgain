class AddColumnstoListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :claimed, :boolean
    add_column :listings, :claimer_id, :integer
    add_column :listings, :available, :boolean
  end
end
