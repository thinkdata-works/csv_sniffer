ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'pry'

require_relative '../lib/csv_sniffer'

RSpec.configure do |config|
  config.filter_run_excluding broken: true, integration: true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
