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

source = node['racktables']['source']

version = source['version']
install_dir = source['install_dir']
version_dir = "#{install_dir}/#{version}"

tarball = "RackTables-#{version}.tar.gz"

cookbook_file "#{Chef::Config['file_cache_path']}/#{tarball}" do
  source tarball
  action :create
  not_if { ::File.exists?(version_dir) }
end

bash 'extract_module' do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    mkdir -p #{version_dir}
    (tar xzvf RackTables-#{version}.tar.gz --strip-components=1 -C #{version_dir})
  EOH
  not_if { ::File.exists?(version_dir) }
end

link "#{install_dir}/current" do
  to "#{version_dir}/wwwroot"
  action :create
end
