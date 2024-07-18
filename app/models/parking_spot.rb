class ParkingSpot < ApplicationRecord
	belongs_to :car, optional: true
	validates :size, presence: true
end
