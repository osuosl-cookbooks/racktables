require_relative 'spec_helper'

describe 'racktables::ldap' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::ldap') }

    before do
        stub_command("/usr/bin/mysql -u root -e 'show databases;'").and_return('foobar')
        stub_command("which php").and_return('/usr/bin/php')
    end

    it 'should install php-ldap' do
        expect(chef_run).to install_package('php-ldap')
    end

    it 'should restart apache2' do
        resource = chef_run.package('php-ldap')
        expect(resource).to notify('service[apache2]').to(:restart).delayed
    end
end
