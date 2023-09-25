require 'rails_helper'
RSpec.describe ParkingSpotsController, type: :controller do
  describe "GET #index" do
    it "assigns all parking spots to @parking_spots" do
      parking_spot1 = create(:parking_spot)
      parking_spot2 = create(:parking_spot)
      
      get :index
      
      expect(assigns(:parking_spots)).to match_array([parking_spot1, parking_spot2])
    end
  end

  describe "GET #registration_numbers_by_color" do
    let!(:car1) { create(:car, color: "red", registration_number: "ABC123") }
    let!(:car2) { create(:car, color: "red", registration_number: "DEF456") }
    let!(:car3) { create(:car, color: "blue", registration_number: "GHI789") }

    it "assigns the registration numbers of cars with the given color to @registration_numbers" do
      get :registration_numbers_by_color, params: { color: "red" }
      expect(assigns(:registration_numbers)).to eq(["ABC123", "DEF456"])
    end
  end

  describe "GET #ticket_numbers_by_color" do
    let!(:car1) { create(:car, color: "red") }
    let!(:car2) { create(:car, color: "red") }
    let!(:car3) { create(:car, color: "blue") }
    let!(:ticket1) { create(:ticket, car: car1) }
    let!(:ticket2) { create(:ticket, car: car2) }
    let!(:ticket3) { create(:ticket, car: car3) }

    it "assigns the ticket numbers of cars with the given color to @ticket_numbers" do
      get :ticket_numbers_by_color, params: { color: "green" }
      expect(assigns(:ticket_numbers)).to eq([])
    end
  end

  describe "GET #ticket_number_by_registration_number" do
    let!(:car) { create(:car, registration_number: "ABC123") }
    let!(:ticket) { create(:ticket, car: car) }
  
    context "when car with the given registration number does not exist" do
      it "assigns 'Car not found' to @ticket_number" do
        get :ticket_number_by_registration_number, params: { registration_number: "XYZ789" }
        expect(assigns(:ticket_number)).to eq("Car not found.")
      end
    end
  end

end