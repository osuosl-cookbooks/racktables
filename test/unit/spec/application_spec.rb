require_relative 'spec_helper'

describe 'racktables::application' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::application') }

    before do
        Chef::EncryptedDataBagItem.stub(:load).with('racktables', 'database').and_return(
            db = {
                "host" => "mysql.example.com",
                "name" => "racktables_db",
                "user" => "racktables_user",
                "password" => "password"
            }
        )
    end

    it 'should create the secret file directory' do
        expect(chef_run).to create_directory('/var/www/html/racktables/wwwroot/inc').with(
            recursive: true
        )
    end

    it 'should touch/chmod the secret.php file' do
        expect(chef_run).to create_template('/var/www/html/racktables/wwwroot/inc/secret.php').with(
            mode: 0400
        )
    end
end
