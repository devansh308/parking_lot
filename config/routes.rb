Rails.application.routes.draw do
  root 'parking_zones#index'
  post "/create_parking_zone", to: "parking_zones#create_parking_zone"

  get "/parking-spots", to: "parking_spots#index", as: 'parking_spots'
  post "/park_car", to: "parking_spots#park_car"
  get "/registration_numbers_by_color", to: "parking_spots#registration_numbers_by_color", as: :registration_numbers_by_color
  get "/ticket_numbers_by_color", to: "parking_spots#ticket_numbers_by_color", as: :ticket_numbers_by_color
  get "/ticket_number_by_registration_number", to: "parking_spots#ticket_number_by_registration_number", as: :ticket_number_by_registration_number
end
