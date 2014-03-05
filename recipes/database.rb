#
# Cookbook Name:: racktables
# Recipe:: database
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
include_recipe "database::mysql"

mysql_connection_info = {
    :host => node['racktables']['db']['host'],
    :username => 'root',
    :password => node['mysql']['server_root_password']
}
create_admin_sql = "#{Chef::Config['file_cache_path']}/racktables_admin.sql"

mysql_database node['racktables']['db']['name'] do
    connection mysql_connection_info
    action :create
end

mysql_database_user node['racktables']['db']['user'] do
    connection mysql_connection_info
    password node['racktables']['db']['password']
    database_name node['racktables']['db']['name']
    privileges [:all]
    action [:create, :grant]
end

template "racktables_admin.sql" do
    path create_admin_sql
    backup false
    action :create
end

mysql_database "create admin user" do
    connection mysql_connection_info
    database_name node['racktables']['db']['name']
    sql { ::File.open(create_admin_sql).read }
    action :query
end