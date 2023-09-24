# == Schema Information
#
# Table name: parking_zones
#
#  id                      :integer          not null, primary key
#  number_of_parking_slots :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class ParkingZone < ApplicationRecord
    validates :number_of_parking_slots, presence: true
    has_many :parking_spots
end
