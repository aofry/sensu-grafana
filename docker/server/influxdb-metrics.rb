#!/usr/bin/env ruby

require 'rubygems'
require 'sensu-handler'
require 'influxdb'

class SensuToInfluxDB < Sensu::Handler

  def filter; end

  def handle
    influxdb_server = settings['influxdb']['server']
    influxdb_port   = settings['influxdb']['port']
    influxdb_user   = settings['influxdb']['username']
    influxdb_pass   = settings['influxdb']['password']
    influxdb_db     = settings['influxdb']['database']

    influxdb_data = InfluxDB::Client.new influxdb_db, :host => influxdb_server,
                                                      :username => influxdb_user,
                                                      :password => influxdb_pass,
                                                      :port => influxdb_port,
                                                      :server => influxdb_server
    mydata = []
    @event['check']['output'].each_line do |metric|
      m = metric.split
      next unless m.count >= 3
      key = m[0].split('.', 1)[0]
      key.gsub!('.', '_')
      thevalue = m[1].to_f
      mydata = {
        values:{host: @event['client']['name'], value: thevalue,
                ip: @event['client']['address'] }
      }
      puts "adi--" + m
      puts mydata

      influxdb_data.write_point('foobar2', mydata)
    end
  end
end