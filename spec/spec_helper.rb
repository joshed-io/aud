begin
  require 'bundler/setup'
rescue LoadError
  puts 'Use of Bundler is recommended'
end

require 'rspec'

require File.expand_path("../../lib/aud", __FILE__)

RSpec.configure do |config|

end

