class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :room_number
      t.string :subject

      t.timestamps
    end
  end
end
