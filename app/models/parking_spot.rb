# == Schema Information
#
# Table name: parking_spots
#
#  id              :integer          not null, primary key
#  spot_number     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  car_id          :integer
#  parking_zone_id :integer          not null
#
# Indexes
#
#  index_parking_spots_on_car_id           (car_id)
#  index_parking_spots_on_parking_zone_id  (parking_zone_id)
#
# Foreign Keys
#
#  car_id           (car_id => cars.id)
#  parking_zone_id  (parking_zone_id => parking_zones.id)
#
class ParkingSpot < ApplicationRecord
  belongs_to :parking_zone
  belongs_to :car, optional: true

  scope :available, -> { where(car_id: nil) }

  def self.find_available_spot
    available.first
  end
end
