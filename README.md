RackTables Cookbook
===================
Cookbook for managing [RackTables](http://racktables.org/).

Requirements
------------
 * Chef

Platform
--------
 * CentOS, Red Hat, Fedora

Cookbooks
---------
RackTables depends upon:
 * [apache2](https://github.com/opscode-cookbooks/apache2)

Attributes
----------
See `attributes/defaults.rb` for attribute defaults.

* `node['racktables']['install_dir']` - Root directory of RackTables
  installation.

* `node['racktables']['server_name']` - vhost ServerName.

* `node['racktables']['server_aliases']` - List of server aliases to populate
  the vhost.

* `node['racktables']['redirect_http']` - Redirect all HTTP traffic to HTTPS

* `node['racktables']['ssl_enabled']` - Enable SSL.

* `node['racktables']['ssl_listen_ports']` - Ports on which SSL should listen.

* `node['racktables']['cert_path']` - Path to the SSL certificate file.

* `node['racktables']['key_path']` - Path to the SSL key file.

Usage
-----
Before applying this cookbook, a RackTables installation should exist on
the client node. If a RackTables installation does not exist,
installation instructions can be found in the RackTables
[README](https://github.com/RackTables/racktables/blob/master/README).

On a client node, add the default recipe to the runlist.

```javascript
{ "runlist": ["recipe[racktables::default]"] }
```

Testing
-------
Run `kitchen test`.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
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
