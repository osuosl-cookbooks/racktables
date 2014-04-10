#
# Cookbook Name:: racktables
# Recipe:: server
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

include_recipe "apache2"
include_recipe "apache2::mod_php5"
if node['racktables']['ssl_enabled']
  include_recipe "apache2::mod_ssl"
end

vhost = node['racktables']
apache = node['apache']

%w{php php-mysql php-pdo php-gd php-snmp php-mbstring
   php-bcmath}.each do |pkg|
  package pkg do
    action :install
  end
end

directory "#{apache['log_dir']}/racktables/" do
   owner apache['user']
   group apache['group']
   mode 0755
   action :create
end

web_app "racktables" do
  server_name vhost['server_name']
  server_aliases vhost['server_aliases']
  docroot vhost['install_dir']
  redirect_http vhost['redirect_http'] && vhost['ssl_enabled']
  ssl_enabled vhost['ssl_enabled']
  ssl_listen_ports vhost['ssl_listen_ports']
end
