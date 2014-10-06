require 'httparty'
require 'json'

class DataSource
  include HTTParty

  def initialize(options={})
  end

  def get_data(options={})
    'Override this'
  end
end
