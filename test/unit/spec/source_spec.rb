require_relative './spec_helper'

describe 'racktables::source' do
    let (:chef_run) do
        ChefSpec::Runner.new do |node|
            node.set['racktables']['source']['version'] = '0.0.1'
        end.converge('racktables::source')
    end

    #before do
    #    stub_command('wget foo').and_return('herps')
    #end

    it 'should download tarball' do
        expect(chef_run).to create_remote_file("#{Chef::Config['file_cache_path']}/RackTables-0.0.1.tar.gz")
    end

    it 'should create install directory' do
        expect(chef_run).to create_directory('/var/www/html/racktables').with(
            owner: 'apache',
            group: 'apache',
            mode: 0755
        )
    end

    it 'should extract tarball to install directory' do
        expect(chef_run).to run_bash('extract_module')
    end
end
