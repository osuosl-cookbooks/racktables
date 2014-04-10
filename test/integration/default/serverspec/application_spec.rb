# Tests for racktables::application
require 'spec_helper'

describe file('/var/www/html/racktables/wwwroot/inc/secret.php') do
    it { should be_a_file }
    it { should be_mode 400 }
    its(:content) { should match /\$pdo_dsn = 'mysql:host=localhost;dbname=racktables_db';/ }
    its(:content) { should match /\$db_username = 'racktables_user';/ }
    its(:content) { should match /\$db_password = 'password';/ }
end
