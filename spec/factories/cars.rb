FactoryBot.define do
  factory :car do
    registration_number { Faker::Vehicle.unique.vin }
    color { Faker::Vehicle.color }
  end
end
