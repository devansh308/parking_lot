require 'rails_helper'
RSpec.describe ParkingZonesController, type: :controller do
  describe "GET #index" do
    it "redirects to parking_spots_path if a parking zone exists" do
      parking_zone = create(:parking_zone)
      get :index
      expect(response).to redirect_to(parking_spots_path)
    end

    it "renders the index template if no parking zone exists" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create_parking_zone" do
    it "creates a parking zone with the specified number of parking spots" do
      spot_count = 10
      post :create_parking_zone, params: { number_of_parking_slots: spot_count }
      expect(ParkingZone.count).to eq(1)
      expect(ParkingZone.first.number_of_parking_slots).to eq(spot_count)
      expect(ParkingSpot.count).to eq(spot_count)
    end

    it "redirects to parking_spots_path with a success notice" do
      spot_count = 5
      post :create_parking_zone, params: { number_of_parking_slots: spot_count }
      expect(response).to redirect_to(parking_spots_path)
      expect(flash[:notice]).to eq("Parking lot created with #{spot_count} spots.")
    end
  end
end
