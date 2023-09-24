class UpdateParkingSpotForeignKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :parking_spots, :parking_lot_id, :parking_zone_id
  end
end
