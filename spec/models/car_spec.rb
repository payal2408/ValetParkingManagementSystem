require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      car = Car.new(license_plat_number: 'ABC123', size: 'small')
      expect(car).to be_valid
    end

    it 'is not valid without a license plate number' do
      car = Car.new(license_plat_number: nil, size: 'small')
      expect(car).to_not be_valid
      expect(car.errors[:license_plat_number]).to include("can't be blank")
    end

    it 'is not valid without a size' do
      car = Car.new(license_plat_number: 'ABC123', size: nil)
      expect(car).to_not be_valid
      expect(car.errors[:size]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it { should have_one(:parking_spot) }
  end
end
