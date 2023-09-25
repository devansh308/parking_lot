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
    has_one :parking_spot, dependent: :destroy
    has_one :ticket, dependent: :destroy

    validates :registration_number, uniqueness: true

    before_validation :normalize_color
    before_validation :normalize_registration_number

    after_create :create_ticket

    private

    def create_ticket
        Ticket.create(car: self)
    end

    def normalize_color
        self.color = color.downcase.strip if color.present?
    end

    def normalize_registration_number
        self.registration_number = registration_number.upcase.strip if registration_number.present?
    end
end
