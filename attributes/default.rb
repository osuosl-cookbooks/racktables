default['racktables']['install_method'] = "source"

default['racktables']['source']['version'] = "0.20.7"
default['racktables']['source']['checksum'] = "173a164f4"
default['racktables']['source']['install_dir'] = "/var/www/racktables"

default['racktables']['redirect_http'] = false
default['racktables']['ssl_enabled'] = false
default['racktables']['ssl_listen_ports'] = [ 443 ]
default['racktables']['cert_path'] = "/etc/pki/tls/certs/wildcard.pem"
default['racktables']['key_path'] = "/etc/pki/tls/private/wildcard.key"

default['racktables']['db']['name'] = "racktables_db"
default['racktables']['db']['user'] = "racktables_user"
default['racktables']['db']['host'] = "localhost"
default['racktables']['db']['password'] = "password"

default['racktables']['admin']['password'] = "password123"
