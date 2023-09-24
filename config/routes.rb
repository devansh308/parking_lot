Rails.application.routes.draw do
  root 'parking_zones#index'
  post "/create_parking_zone", to: "parking_zones#create_parking_zone"
end
