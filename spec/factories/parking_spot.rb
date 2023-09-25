FactoryBot.define do
  factory :parking_spot do
    spot_number { 1 }
    association :parking_zone
    association :car, factory: :car
  end
end
