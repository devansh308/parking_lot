require 'rails_helper'

RSpec.describe ParkingSpot, type: :model do
  describe "associations" do
    it { should belong_to(:parking_zone) }
    it { should belong_to(:car).optional }
  end

  describe "scopes" do
    describe ".available" do
      let!(:parking_spot1) { create(:parking_spot, car: nil) }
      let!(:parking_spot2) { create(:parking_spot, car: create(:car)) }

      it "returns only the available parking spots" do
        expect(ParkingSpot.available).to contain_exactly(parking_spot1)
      end
    end
  end

  describe ".find_available_spot" do
    let!(:parking_spot1) { create(:parking_spot, car: nil) }
    let!(:parking_spot2) { create(:parking_spot, car: create(:car)) }

    it "returns the first available parking spot" do
      expect(ParkingSpot.find_available_spot).to eq(parking_spot1)
    end
  end
end
