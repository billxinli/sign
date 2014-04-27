require 'httparty'
require 'json'

class DataSource
  include HTTParty

  def initialize
  end

  def get_data
    'Override this'
  end
end