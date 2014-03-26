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

cookbook_file "#{Chef::Config['file_cache_path']}/Racktables-#{node['racktables']['source']['version']}.tar.gz" do
  source "RackTables-#{node['racktables']['source']['version']}.tar.gz"
  action :create
end

bash 'extract_module' do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    tar xzvf Racktables-#{version}.tar.gz
    (cp -r RackTables-#{version}/* #{install_dir})
    (chown -R #{node['apache']['user']}:#{node['apache']['group']} #{install_dir})
  EOH
end
