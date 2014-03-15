# Tests for racktables::source
require 'serverspec'

describe file('/var/www/html/racktables/') do
    it { should be_a_directory }
    it { should be_owned_by 'apache' }
    it { should be_grouped_into 'apache' }
end

describe file('/var/www/html/racktables/wwwroot/') do
    it { should be_a_directory }
    it { should be_owned_by 'apache' }
    it { should be_grouped_into 'apache' }
end
