require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      car = Car.new(registration_number: "ABC123", color: "Red")
      expect(car).to be_valid
    end

    it "is not valid without a registration number" do
      car = Car.new(registration_number: nil, color: "Red")
      expect(car).not_to be_valid
      expect(car.errors[:registration_number]).to include("can't be blank")
    end

    it "is not valid without a color" do
      car = Car.new(registration_number: "ABC123", color: nil)
      expect(car).not_to be_valid
      expect(car.errors[:color]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "belongs to a parking spot" do
      car = Car.new(registration_number: "ABC123", color: "Red")
      expect(car).to respond_to(:parking_spot)
    end
  end
end
