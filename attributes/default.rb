default['racktables']['install_method'] = "source"

default['racktables']['source']['version'] = "0.20.4"
default['racktables']['source']['checksum'] = "cbd1e2...2b4f65"
default['racktables']['source']['install_dir'] = "#{node['apache']['docroot_dir']}/racktables"
default['racktables']['source']['url'] = "https://github.com/RackTables/racktables/archive"

default['racktables']['vhost']['server_aliases'] = [node['fqdn']]
default['racktables']['vhost']['redirect_http'] = false
default['racktables']['vhost']['ssl_enabled'] = false
default['racktables']['vhost']['ssl_listen_ports'] = [ 443 ]
default['racktables']['vhost']['cert_path'] = "/etc/pki/tls/certs/wildcard.pem"
default['racktables']['vhost']['key_path'] = "/etc/pki/tls/private/wildcard.key"

default['racktables']['db']['name'] = "racktables_db"
default['racktables']['db']['user'] = "racktables_user"
default['racktables']['db']['host'] = "localhost"
default['racktables']['db']['password'] = "password"
