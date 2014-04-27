require_relative 'data_source'

class TemperatureDataSource < DataSource
  base_uri 'api.openweathermap.org'

  def initialize(location = 'Toronto,ON,Canada')
    @options = { q: location }
  end

  def get_data
    weather   = self.class.get('/data/2.5/weather', query: @options)
    high_temp = kelvin_to_celsius(weather['main']['temp_max'])
    low_temp  = kelvin_to_celsius(weather['main']['temp_min'])
    "H:#{high_temp.round(2)}C L:#{low_temp.round(2)}C"
  end

  private
  def kelvin_to_celsius(k)
    k - 273.15
  end
end