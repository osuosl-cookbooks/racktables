name             'racktables'
maintainer       'Oregon State University'
maintainer_email 'system@osuosl.org'
license          'Apache 2.0'
description      'Cookbook for managing RackTables'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.3.0'

recipe 'racktables::default', 'Install from source, and setup web app'
recipe 'racktables::server', 'Setup the RackTables web appliction using apache'
recipe 'racktables::application', 'Configure the RackTables application'

depends 'apache2'
