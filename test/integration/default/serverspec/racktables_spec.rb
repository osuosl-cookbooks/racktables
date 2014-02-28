# Tests for a Racktable install
require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

# Setup something with root user paths?
# Not sure what is going on here, but it's in the kitchen-ci docs
RSpec.configure do |c|
    c.before :all do
        c.path = '/sbin:/usr/sbin'
    end
end


describe "Racktables SQL" do
    # Check the SQL db
    # Check the user exists
    # Check for user access
end

describe "Racktables Server" do
    # apache installed and running
    # vhost exists
    # site available through http and https
    # logs exist
    # mod_php5 installed
end

describe "Racktables Source" do
    # Extract directory exists and non-empty
end

describe "Racktables Secrets" do
    # Racktables user exists
    # Secret file exists and is non-empty
end
