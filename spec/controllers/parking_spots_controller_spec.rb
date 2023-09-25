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

end