default['racktables']['install_dir'] = "#{node['apache']['docroot_dir']}/racktables/wwwroot"

default['racktables']['vhost']['server_name'] = node['fqdn']
default['racktables']['vhost']['server_aliases'] = [node['fqdn']]
default['racktables']['vhost']['redirect_http'] = false
default['racktables']['vhost']['ssl_enabled'] = false
default['racktables']['vhost']['ssl_listen_ports'] = [ 443 ]
default['racktables']['vhost']['cert_path'] = "/etc/pki/tls/certs/wildcard.pem"
default['racktables']['vhost']['key_path'] = "/etc/pki/tls/private/wildcard.key"
