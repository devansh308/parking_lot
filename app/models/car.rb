class Car < ApplicationRecord
    has_one :parking_spot
    has_one :ticket
end
