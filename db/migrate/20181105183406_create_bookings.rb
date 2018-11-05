class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.float :cost

      t.timestamps
    end
  end
end
