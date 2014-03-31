# RackTables Cookbook
Cookbook for managing and deploying [RackTables](http://racktables.org/).

## Requirements
 * Chef

## Platform
 * CentOS, Red Hat, Fedora

## Cookbooks
RackTables depends upon:
 * [apache2](https://github.com/opscode-cookbooks/apache2)
 * [database](https://github.com/opscode-cookbooks/database)
 * [mysql](https://github.com/opscode-cookbooks/mysql) - If testing

## Attributes
See `attributes/defaults.rb` for attribute defaults.

* `node['racktables']['install_method']` - Installation method for
  RackTables.

* `node['racktables']['admin']['password']` - Password for the administrative
  interface.

### Source Specific
* `node['racktables']['source']['version']` - Version of RackTables to
  install.

* `node['racktables']['source']['checksum']` - SHA256 of the tarball.

* `node['racktables']['source']['install_dir']` - Installation directory for
  RackTables.

* `node['racktables']['source']['url']` - URL of the source tarball
  directory.

### Apache Specific
* `node['racktables']['server_aliases']` - List of server aliases to populate
  the vhost.

* `node['racktables']['redirect_http']` - Redirect all HTTP traffic to HTTPS

* `node['racktables']['ssl_enabled']` - Enable SSL.

* `node['racktables']['ssl_listen_ports']` - Ports on which SSL should listen.

* `node['racktables']['cert_path']` - Path to the SSL certificate file.

* `node['racktables']['key_path']` - Path to the SSL key file.

### Database Specific
* `node['racktables']['db']['name']` - Database name.

* `node['racktables']['db']['user']` - Database user.

* `node['racktables']['db']['host']` - Datbase host.

* `node['racktables']['db']['password']` - Database password. Should be stored
  in an encrypted databag.

## Usage
On a client node, add the default recipe to the runlist.

```javascript
{ "runlist": ["recipe[racktables::default]"] }
```

After the node converges, navigate to the installation module URL. With the
defaults, this is: `http://localhost:8080/?module=installer`

## Testing
Run `kitchen test`.

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors
 - Author: Trevor Bramwell (<bramwelt@osuosl.org>)
 - Author: Rudy Grigar (<basic@osuosl.org>)
 - Author: Jordan Evans (<jordane@osuosl.org>)
 - Author: Daniel Takamori (<pono@osuosl.org>)
 - Author: Lance Albertson (<lance@osuosl.org>)

```text
Copyright: 2013-2014 Oregon State University

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
