#
# Cookbook Name:: racktables
# Recipe:: source
#
# Copyright (C) 2013, Oregon State University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

version = node['racktables']['source']['version']
install_dir = node['racktables']['source']['install_dir']
racktables_url= "https://github.com/RackTables/racktables/archive/RackTables-#{version}.tar.gz"

directory node['racktables']['source']['install_dir'] do
  owner node['apache']['user']
  group node['apache']['group']
  mode 0755
  action :create
end

remote_file "#{Chef::Config['file_cache_path']}/RackTables-#{version}.tar.gz" do
  source racktables_url
  checksum node['racktables']['source']['checksum']
  backup false
  action :create
end

# Only extract the Tarball if the version is not the latest
bash 'extract_module' do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    tar xzvf RackTables-#{version}.tar.gz
    (cp -r racktables-RackTables-#{version}/* #{install_dir})
  EOH
  not_if "grep #{version} #{install_dir}/ChangeLog"
end
