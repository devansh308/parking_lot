class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end

  def park_car
    car = Car.new(car_params)
    if car.save
      parking_spot = ParkingSpot.where(car_id: nil).first
      if parking_spot
        parking_spot.update(car: car)
        redirect_to parking_spots_path, notice: "Car parked successfully. Spot number: #{parking_spot.spot_number}"
      else
        car.destroy
        redirect_to parking_spots_path, alert: "No available parking spots."
      end
    else
      redirect_to parking_spots_path, alert: "Failed to park the car."
    end
  end

  private

  def car_params
    params.require(:car).permit(:registration_number, :color)
  end

end
