require_relative 'spec_helper'

describe 'racktables::application' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::application') }

    it 'should create the secret file directory' do
        expect(chef_run).to create_directory('/var/www/html/racktables/current/inc').with(
            recursive: true
        )
    end

    it 'should touch/chmod the secret.php file' do
        expect(chef_run).to create_template('/var/www/html/racktables/current/inc/secret.php').with(
            mode: 0400
        )
    end
end
