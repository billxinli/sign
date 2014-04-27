#!/usr/bin/env ruby

require_relative 'lib/data_source'
require_relative 'lib/ttc_data_source'
require_relative 'lib/temperature_data_source'

print [TemperatureDataSource.new, TtcDataSource.new].collect { |x| x.get_data }.join(' | ')
