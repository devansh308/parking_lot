class ParkingZonesController < ApplicationController
  def index
    @parking_zone = ParkingZone.first
    unless @parking_zone.nil?
        redirect_to parking_spots_path
    end
  end

  def create_parking_zone
    spot_count = params[:number_of_parking_slots].to_i
    parking_zone = ParkingZone.create(number_of_parking_slots: spot_count)
    spot_count.times do |spot_number|
      parking_spot = ParkingSpot.create(
        spot_number: spot_number + 1,
        parking_zone: parking_zone
      )
    end
    redirect_to parking_spots_path, notice: "Parking lot created with #{spot_count} spots."
  end
end
