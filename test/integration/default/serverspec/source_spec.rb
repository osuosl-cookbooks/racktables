# Tests for racktables::source
require 'spec_helper'

describe file('/var/www/html/racktables/0.20.7/') do
    it { should be_a_directory }
end

describe file('/var/www/html/racktables/current') do
    it { should be_linked_to '/var/www/html/racktables/0.20.7/wwwroot'}
end
