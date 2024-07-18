class ParkingSpotsController < ApplicationController
  before_action :get_the_car, only: [:admit_car, :exit_car]

  def admit_car
    result = ValetParkingService.new.admit_the_car(@car)
    render json: { message: result }
  end

  def exit_car
    result = ValetParkingService.new.exit_the_car(@car)
    render json: { message: result }
  end

  def shuffle_cars
    render json: { message: 'Cars shuffled successfully' }
  end

  private 

  def get_the_car
  	@car = Car.find_by(id: params[:car_id])
  	render json: { message: "Car not found" } unless @car.present?
  end
end
