class ParkingSpot < ApplicationRecord
  belongs_to :parking_zone
  belongs_to :car
end
