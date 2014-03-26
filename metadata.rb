name             'racktables'
maintainer       'Oregon State University'
maintainer_email 'bramwelt@osuosl.org'
license          'Apache 2.0'
description      'Manages deploying Racktables: the datacenter asset manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.7'

recipe 'racktables::default', 'Install from source, and setup web app'
recipe 'racktables::server', 'Setup the racktables web appliction using apache'
recipe 'racktables::source', 'Install racktables for source tarball'
recipe 'racktables::application', 'Configure the racktables application'
recipe 'racktables::database', 'Setup the database for Racktables'

depends 'apache2'
depends 'database'
depends 'mysql'
