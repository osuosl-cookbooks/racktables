# Tests for racktables::application
require 'spec_helper'

describe file('/var/www/html/racktables/wwwroot/inc/secret.php') do
    it { should be_a_file }
    it { should be_mode 666 }
    it { should be_owned_by 'apache' }
    it { should be_grouped_into 'apache' }
end
