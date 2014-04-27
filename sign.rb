#!/usr/bin/env ruby

require_relative 'lib/data_source'
require_relative 'lib/data_source/ttc_data_source'
require_relative 'lib/data_source/temperature_data_source'
require_relative 'lib/data_source/time_data_source'
require_relative 'lib/ascp'

message = [TimeDataSource.new, TemperatureDataSource.new, TtcDataSource.new].collect { |x| x.get_data }.compact.join('\\')

ascp              = ASCP.new('/dev/ttyUSB0')
ascp.type_code    = 'ALL_SIGN'
ascp.sign_address = 'BROADCAST'
ascp.simple_string!(message)



