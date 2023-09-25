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

  def registration_numbers_by_color
    color = params[:color]&.downcase&.strip
    cars = Car.where(color: color)
    @registration_numbers = cars.pluck(:registration_number)
  end

  def ticket_numbers_by_color
    color = params[:color]&.downcase&.strip
    @ticket_numbers = Ticket.joins(car: :parking_spot).where(cars: { color: color }).pluck(:id)
  end

  def ticket_number_by_registration_number
    registration_number = params[:registration_number]
    if registration_number.present?
      @ticket_number = Ticket.joins(:car).where(car: {registration_number: registration_number}).pick(:id)
      unless @ticket_number
        @ticket_number = "Car not found."
      end
    end
  end

  def unpark_car
    @parking_spot = ParkingSpot.find(params[:id])
    @car = @parking_spot.car

    if @car.present?
      @parking_spot.car = nil
      @parking_spot.save
      @car.destroy

      redirect_to parking_spots_path, notice: "Car has been unparked."
    end
  end

  private

  def car_params
    params.require(:car).permit(:registration_number, :color)
  end

end
