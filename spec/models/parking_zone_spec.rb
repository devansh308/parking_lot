require 'rails_helper'

RSpec.describe ParkingZone, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      parking_zone = ParkingZone.new(number_of_parking_slots: 10)
      expect(parking_zone).to be_valid
    end

    it "is not valid without a number of parking slots" do
      parking_zone = ParkingZone.new(number_of_parking_slots: nil)
      expect(parking_zone).not_to be_valid
      expect(parking_zone.errors[:number_of_parking_slots]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has many parking spots" do
      parking_zone = ParkingZone.new(number_of_parking_slots: 10)
      expect(parking_zone).to respond_to(:parking_spots)
    end
  end
end
