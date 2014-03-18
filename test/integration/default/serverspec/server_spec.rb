# Tests for the Racktable server recipe
require 'spec_helper'

# Dependencies installed
describe package('httpd') do
    it { should be_installed }
end
describe package("php") do
    it { should be_installed }
end

# apache enabled and running
describe service('httpd') do
    it { should be_enabled }
    it { should be_running }
end

# Port 80 open and accessable
describe port(80) do
    it { should be_listening }
end
describe host("localhost") do
    it { should be_reachable }
end

# Vhost file exists
describe file("/etc/httpd/sites-enabled/racktables.conf") do
    it { should be_file }
end

# Log directory exists
describe file("/var/log/httpd/racktables") do
    it { should be_directory }
end
