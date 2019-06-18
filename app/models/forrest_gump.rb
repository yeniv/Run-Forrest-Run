# require 'mapbox-sdk'

class ForrestGump < ApplicationRecord
  has_many :tweets
  serialize :route, Array
  serialize :quotes, Array

  def self.route
    Mapbox.access_token = ENV['MAPBOX_API_KEY']
    route_coordinates = []

    locations = [                 # Running locations, first to last [long, lat]
      [-85.9769900, 32.6122000],  # Alabama
      [-118.4977100, 34.0110350], # Santa Monica Pier
      [-69.2607790, 43.9177960],  # Marshall Point Lighthouse
      [-112.326997, 48.633449],   # Cut Bank, Montana
      [-113.9872550, 48.5026610], # West Glaicer, Montana
      [-124.1722110, 47.0707110], # Ocean City, Washington
      [-80.551068, 32.399763],    # Sea Island Pkwy, South Carolina
      [-81.870446, 36.071090],    # Linville, North Carolina
      [-109.990782, 37.101523]    # Forrest Gump Point, Mexican Hat, Utah
    ]

    locations.each_with_index do |location, i|
      break if i + 1 == locations.length

      coordinates = Mapbox::Directions.directions([
        { 'longitude' => location[0], 'latitude' => location[1] },
        { 'longitude' => locations[i + 1][0], 'latitude' => locations[i + 1][1] }
        ], 'driving', geometries: 'geojson')

      route_coordinates << coordinates.first['routes'].first['geometry']['coordinates']
    end
    route_coordinates.flatten(1)
  end
end

