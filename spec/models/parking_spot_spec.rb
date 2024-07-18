require 'rails_helper'

RSpec.describe ParkingSpot, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      parking_spot = ParkingSpot.new(size: 'small', status: 'available')
      expect(parking_spot).to be_valid
    end

    it 'is not valid without a size' do
      parking_spot = ParkingSpot.new(size: nil, status: 'available')
      expect(parking_spot).to_not be_valid
      expect(parking_spot.errors[:size]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it { should belong_to(:car).optional }
  end
end
