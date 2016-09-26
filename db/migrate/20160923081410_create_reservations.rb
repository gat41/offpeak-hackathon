class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
 			t.belongs_to :listing, index: true
      t.belongs_to :user, index: true
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :num_guests
      t.integer :total_price
      t.timestamps null: false
    end
  end
end
