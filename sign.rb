#!/usr/bin/env ruby

require_relative 'lib/data_source/data_source'
require_relative 'lib/data_source/ttc_data_source'
require_relative 'lib/data_source/temperature_data_source'
require_relative 'lib/data_source/date_time_data_source'
require_relative 'lib/ascp'

dtds = DateTimeDataSource.new
tds = TemperatureDataSource.new
ttcds = TtcDataSource.new

message = [
  dtds.get_data, 
  tds.get_data,
  ttcds.get_data({stopId: '10210', routeTag: '511'}), 
  ttcds.get_data({stopId: '10773', routeTag: '509'})].compact.join('|')

ascp              = ASCP.new('/dev/ttyUSB0')
ascp.type_code    = 'ALL_SIGN'
ascp.sign_address = 'BROADCAST'
ascp.simple_string!(message)
