# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  car_id     :integer          not null
#
# Indexes
#
#  index_tickets_on_car_id  (car_id)
#
# Foreign Keys
#
#  car_id  (car_id => cars.id)
#
class Ticket < ApplicationRecord
  belongs_to :car
  validates :car_id, presence: true
end
