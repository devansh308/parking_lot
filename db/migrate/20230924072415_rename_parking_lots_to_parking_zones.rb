class RenameParkingLotsToParkingZones < ActiveRecord::Migration[7.0]
  def change
    rename_table :parking_lots, :parking_zones
  end
end
