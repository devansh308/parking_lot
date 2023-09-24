class ParkingZonesController < ApplicationController
  def index
    @parking_zone = ParkingZone.first
    unless @parking_zone.nil?
        redirect_to parking_spots_path
    end
  end
end
