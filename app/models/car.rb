class Car < ApplicationRecord
  validates :license_plat_number, presence: true 
  validates :size, presence: true 
  has_one :parking_spot
end
