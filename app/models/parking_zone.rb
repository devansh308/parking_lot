class ParkingZone < ApplicationRecord
    validates :number_of_parking_slots, presence: true
end
