# Tests for racktables::ldap
require 'spec_helper'

describe package('php-ldap') do
    it { should be_installed }
end
