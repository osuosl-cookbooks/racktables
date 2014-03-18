require 'chefspec'
require 'chefspec/server'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.start! }

RSpec.configure do |config|
    config.platform = 'centos'
    config.version = '6.5'
end
