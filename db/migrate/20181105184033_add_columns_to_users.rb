class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :is_owner, :boolean
    add_column :users, :location, :string
    add_column :users, :photo, :string
  end
end
