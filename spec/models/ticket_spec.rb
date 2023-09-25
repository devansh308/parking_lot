require 'rails_helper'
RSpec.describe Ticket, type: :model do
  describe "associations" do
    it { should belong_to(:car) }
  end

  describe "validations" do
    it { should validate_presence_of(:car_id) }
  end
end
