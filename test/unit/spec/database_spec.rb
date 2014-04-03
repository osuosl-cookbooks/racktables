require_relative 'spec_helper'
require_relative 'support/matchers'

describe 'racktables::database' do
    let (:chef_run) do
        ChefSpec::Runner.new.converge('racktables::database')
    end

    before do
        stub_command("/usr/bin/mysql -u root -e 'show databases;'").and_return('somedatabase')
    end

    it 'includes database recipes' do
        expect(chef_run).to include_recipe('mysql::server')
        expect(chef_run).to include_recipe('database::mysql')
    end

    it 'does not include recipes if not on localhost' do
        chef_run.node.set['racktables']['db']['host'] = 'somefqdn.example.com'
        chef_run.converge('racktables::database')

        expect(chef_run).to_not include_recipe('mysql::server')
        expect(chef_run).to_not include_recipe('database::mysql')
    end

    # The following tests require a custom 'mysql_database' and
    # 'mysql_database_user' to exist. These currently exist in
    # 'support/matchers' but need to be pushed upstream to the
    # `database` or `mysql` cookbook
    
    it 'creates the racktables database' do
        chef_run.node.set['mysql']['server_root_password'] = 'rootpass'
        chef_run.converge('racktables::database')

        expect(chef_run).to create_mysql_database('racktables_db').with(
            connection: {
                :host => 'localhost',
                :username => 'root',
                :password => 'rootpass'
            }
        )
    end

    it 'create a database user' do
        expect(chef_run).to create_mysql_database_user('racktables_user').with(
            password: 'password',
            database_name: 'racktables_db'
        )
    end

    it 'grants permissions to the database user' do
        expect(chef_run).to grant_mysql_database_user('racktables_user').with(
            privileges: [:all],
            database_name: 'racktables_db'
        )
    end

end
