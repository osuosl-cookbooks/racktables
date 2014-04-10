default['racktables']['install_dir'] = "#{node['apache']['docroot_dir']}/racktables/wwwroot"
default['racktables']['server_name'] = node['fqdn']
default['racktables']['server_aliases'] = [node['fqdn']]
default['racktables']['redirect_http'] = false
default['racktables']['ssl_enabled'] = false
default['racktables']['ssl_listen_ports'] = [ 443 ]
default['racktables']['cert_path'] = "/etc/pki/tls/certs/wildcard.pem"
default['racktables']['key_path'] = "/etc/pki/tls/private/wildcard.key"
