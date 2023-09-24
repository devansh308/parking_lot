class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end
end
