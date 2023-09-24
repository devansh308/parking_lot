# == Schema Information
#
# Table name: cars
#
#  id                  :integer          not null, primary key
#  color               :string
#  registration_number :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_cars_on_registration_number  (registration_number) UNIQUE
#
class Car < ApplicationRecord
    has_one :parking_spot
    has_one :ticket
end
