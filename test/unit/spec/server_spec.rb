require_relative 'spec_helper'

describe 'racktables::server' do
    let (:chef_run) do
        ChefSpec::Runner.new do |node|
            node.set['racktables']['vhost']['ssl_enabled'] = true
            node.set['racktables']['vhost']['ssl_listen_ports'] = [443]
        end.converge('racktables::server')
    end

    before do
        stub_command('which php').and_return('/usr/bin/php')
    end

    it 'should include apache2 recipes' do
        expect(chef_run).to include_recipe('apache2::default')
        expect(chef_run).to include_recipe('apache2::mod_php5')
        expect(chef_run).to include_recipe('apache2::mod_ssl')
    end

    it 'should install php packages' do
        %w{php php-mysql php-pdo php-gd php-snmp php-mbstring
           php-bcmath}.each do |pkg|
            expect(chef_run).to install_package(pkg)
        end
    end

    it 'should create the log directory' do
        expect(chef_run).to create_directory('/var/log/httpd/racktables/').with(
            owner: 'apache',
            group: 'apache',
            mode: 0755
        )
    end
end
