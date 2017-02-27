class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :description
      t.string :homepage
      t.string :photo
      t.string :registration

      t.timestamps
    end
  end
end
