Rails.application.routes.draw do
  root 'parking_zones#index'
  post "/create_parking_zone", to: "parking_zones#create_parking_zone"

  get "/parking-spots", to: "parking_spots#index", as: 'parking_spots'
end
