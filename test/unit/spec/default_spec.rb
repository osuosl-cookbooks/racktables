require_relative 'spec_helper'

describe 'racktables::default' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::default') }

    before do
        stub_command("/usr/bin/mysql -u root -e 'show databases;'").and_return("foo")
        stub_command("which php").and_return("/usr/bin/php")
        Chef::EncryptedDataBagItem.stub(:load).with('racktables', 'database').and_return(
            db = {
                "host" => "mysql.example.com",
                "name" => "racktables_db",
                "user" => "racktables_user",
                "password" => "password"
            }
        )
    end

    it 'should include all recipes' do
        expect(chef_run).to include_recipe('racktables::application')
        expect(chef_run).to include_recipe('racktables::server')
    end
end
