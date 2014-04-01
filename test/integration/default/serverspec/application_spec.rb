# Tests for racktables::application
require 'spec_helper'

describe file('/var/www/html/racktables/current/inc/secret.php') do
    it { should be_a_file }
    it { should be_mode 666 }
end
