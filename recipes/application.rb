#
# Cookbook Name:: racktables
# Recipe:: application
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

install_dir = node['racktables']['install_dir']

secret_path = "#{install_dir}/inc"

db = Chef::EncryptedDataBagItem.load("racktables", "database")

directory secret_path do
    recursive true
    action :create
end

template "#{secret_path}/secret.php" do
    source "secret.php.erb"
    owner node['apache']['user']
    group node['apache']['group']
    mode 0400
    variables(
        :db_host => db['host'],
        :db_name => db['name'],
        :db_user => db['user'],
        :db_pass => db['password']
    )
    action :create
end
