class CreateParkingLots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_lots do |t|
      t.integer :number_of_parking_slots

      t.timestamps
    end
  end
end
