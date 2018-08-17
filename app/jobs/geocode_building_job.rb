class GeocodeBuildingJob < ApplicationJob
  queue_as :default
  def perform(building_id)
    building = Building.find(building_id)
    address = [building.address, building.city, building.zip].join(' ')
    latitude, longitude = Geocoder.coordinates(address)
    building.update!(latitude: latitude, longitude: longitude)
  end
end
