class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.string :model
      t.string :category
      t.float :price
      t.boolean :is_rented
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
