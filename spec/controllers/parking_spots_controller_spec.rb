require 'rails_helper'

RSpec.describe ParkingSpotsController, type: :controller do
  let(:car) { FactoryBot.create(:car, size: "MyString", license_plat_number: "MyString") }
  let!(:parking_spot) { FactoryBot.create(:parking_spot)}

  describe 'POST #admit_car' do
    context 'when the car is found' do
      it 'calls the admit car action' do
        post :admit_car, params: { car_id: car.id }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['message']).to eq("Car #{car.license_plat_number} is parked in #{parking_spot.size}")
      end
    end

    context 'when the car is not found' do
      it 'returns an error message' do
        post :admit_car, params: { car_id: '999' }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['message']).to eq('Car not found')
      end
    end
  end

  describe 'POST #exit_car' do
    context 'when the car is found' do
      it 'calls the exit_the_car method of ValetParkingService' do
        post :exit_car, params: { car_id: car.id }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['message']).to eq("Car #{car.license_plat_number} has left spot #{parking_spot.size}")
      end
    end

    context 'when the car is not found' do
      it 'returns an error message' do
        post :exit_car, params: { car_id: '999' }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['message']).to eq('Car not found')
      end
    end
  end

  describe 'POST #shuffle_cars' do
    it 'returns a success message' do
      post :shuffle_cars
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to eq('Cars shuffled successfully')
    end
  end
end
