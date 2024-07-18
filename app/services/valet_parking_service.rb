class ValetParkingService
  def admit_the_car(car) 
    spot = ParkingSpot.where(status: 'available').order(size: :desc).find_by('size <= ?', car.size)
    if spot.present?
      spot.update(status: 'occupied', car: car)
      "Car #{car.license_plat_number} is parked in #{spot.size}"
    else
      "No available spot for car #{car.license_plat_number}"
    end
  end

  def exit_the_car(car)
    spot = ParkingSpot.find_by(car: car)
    if spot.present?
      spot.update(status: 'available', car: nil)
      "Car #{car.license_plat_number} has left spot #{spot.size}"
    else
      "Car #{car.license_plat_number} is not found in any spot"
    end
  end

  def shuffle_the_cars
    small_car_spot = ParkingSpot.find_by(size: 'small', status: 'occupied')
    medium_car_spot = ParkingSpot.find_by(size: 'medium', status: 'occupied')
    large_car_spot = ParkingSpot.find_by(size: 'large', status: 'occupied')
    
    if small_car_spot.nil? && medium_car_spot.present?
      medium_car_spot.update(size: 'small')
    end

    if medium_car_spot.nil? && large_car_spot.present?
      large_car_spot.update(size: 'medium')
    end

    if large_car_spot.nil?
      large_car_spot&.update(size: 'large')
    end
  end
end
