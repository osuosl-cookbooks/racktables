require_relative 'spec_helper'

describe 'racktables::default' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::default') }

    before do
        stub_command("/usr/bin/mysql -u root -e 'show databases;'").and_return("foo")
        stub_command("which php").and_return("/usr/bin/php")
    end

    it 'should include all recipes by default' do
        expect(chef_run).to include_recipe('racktables::database')
        expect(chef_run).to include_recipe('racktables::application')
        expect(chef_run).to include_recipe('racktables::server')
    end

    it 'should not include the database recipe if not on localhost' do
        chef_run.node.set['racktables']['db']['host'] = 'somefqdn.example.com'
        chef_run.converge('racktables::default')

        expect(chef_run).to_not include_recipe('racktables::database')
    end
end
