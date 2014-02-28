# Tests for specific Racktable application items
require 'serverspec'

describe user('racktables') do
    it { should exist }
    it { should belong_to_group 'racktables' }
    it { should have_login_shell '/bin/false' }
end

describe file('/var/www/racktables/wwwroot/inc/secret.php') do
    it { should be_a_file}
    its(:content) { should match /\$pdo_dsn/ }
    its(:content) { should match /\$user_auth_src/ }
end
