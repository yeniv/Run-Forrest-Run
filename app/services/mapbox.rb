require "mapbox-sdk"
Mapbox.access_token = 'pk.eyJ1IjoieWVuaXYiLCJhIjoiY2p3cXg0ZHVpMnNtbTRicDc2cTlmZGR4ayJ9.Gngi8Zw4HfbfjOKMzQ5pxA'
# Mapbox.access_token = ENV['MAPBOX_API_KEY']

# running locations, first to last [long, lat]
location_one = [-85.9769900, 32.6122000];    # Alabama
location_two = [-118.4977100, 34.0110350];   # Santa Monica Pier
location_three = [-69.2607790, 43.9177960];  # Marshall Point Lighthouse
location_four = [-112.326997, 48.633449];    # Cut Bank, Montana
location_five = [-113.9872550, 48.5026610];  # West Glaicer, Montana
location_six = [-124.1722110, 47.0707110];   # Ocean City, Washington
location_seven = [-80.551068, 32.399763];    # Sea Island Pkwy, South Carolina
location_eight = [-81.870446, 36.071090];    # Linville, North Carolina
location_nine = [-109.990782, 37.101523];    # Forrest Gump Point, Mexican Hat, Utah


# To provide query parameters to the Directions API, such as `geometries`, `language` or `steps`, add those in a Hash as third parameter (find the full list of parameters (here)[https://www.mapbox.com/api-documentation/navigation/#retrieve-directions]).

# For instance, to use the `geometries` and `voice_instructions` parameter:

directions = Mapbox::Directions.directions([
  { 'longitude' => location_one[0], 'latitude' => location_one[1] },
  { 'longitude' => location_two[0], 'latitude' => location_two[1] },
  { 'longitude' => location_three[0], 'latitude' => location_three[1] },
  { 'longitude' => location_four[0], 'latitude' => location_four[1] },
  { 'longitude' => location_five[0], 'latitude' => location_five[1] },
  { 'longitude' => location_six[0], 'latitude' => location_six[1] },
  { 'longitude' => location_seven[0], 'latitude' => location_seven[1] },
  { 'longitude' => location_eight[0], 'latitude' => location_eight[1] },
  { 'longitude' => location_nine[0], 'latitude' => location_nine[1] }
  ], 'driving', geometries: 'geojson')

return directions


