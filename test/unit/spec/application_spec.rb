require_relative 'spec_helper'

describe 'racktables::application' do
    let (:chef_run) { ChefSpec::Runner.new.converge('racktables::application') }

    it 'should touch/chmod the secret.php file' do
        expect(chef_run).to create_file('/var/www/html/racktables/current/inc/secret.php').with(
            mode: 0666
        )
    end
end
