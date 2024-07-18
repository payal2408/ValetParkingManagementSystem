class CreateParkingSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :parking_spots do |t|
      t.string :size
      t.string :status, default: 'available'
      t.integer :car_id

      t.timestamps
    end
  end
end
