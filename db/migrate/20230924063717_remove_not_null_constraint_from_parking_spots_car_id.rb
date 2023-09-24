class RemoveNotNullConstraintFromParkingSpotsCarId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :parking_spots, :car_id, true
  end
end
