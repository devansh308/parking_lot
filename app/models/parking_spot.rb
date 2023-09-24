class ParkingSpot < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :car
end
