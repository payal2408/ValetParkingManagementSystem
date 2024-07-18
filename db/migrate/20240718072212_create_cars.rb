class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :license_plat_number
      t.string :size

      t.timestamps
    end
  end
end
