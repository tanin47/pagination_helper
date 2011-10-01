# encoding: utf-8
require 'simplecov'
SimpleCov.start do
  coverage_dir("coverage") 
end

require 'rspec'

require File.expand_path("../../lib/pagination_month",__FILE__)
require File.expand_path("../../lib/pagination_unit",__FILE__)
require File.expand_path("../../lib/pagination_helper",__FILE__)

RSpec.configure do |config|
  
  config.mock_with :rspec

end