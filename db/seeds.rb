# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Car.create(license_plat_number: 'A', size: 'small')
Car.create(license_plat_number: 'B', size: 'small')
Car.create(license_plat_number: 'C', size: 'small')
Car.create(license_plat_number: 'D', size: 'large')
Car.create(license_plat_number: 'D', size: 'large')
Car.create(license_plat_number: 'D', size: 'medium')
Car.create(license_plat_number: 'D', size: 'medium')
ParkingSpot.create(size: 'small', status: 'available')
ParkingSpot.create(size: 'medium', status: 'available')
ParkingSpot.create(size: 'large', status: 'available')
ParkingSpot.create(size: 'medium', status: 'available')
ParkingSpot.create(size: 'large', status: 'available')