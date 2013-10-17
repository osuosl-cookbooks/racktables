name             'racktables'
maintainer       'OSU Open Source Lab'
maintainer_email 'bramwelt@osuosl.org'
license          'All rights reserved'
description      'Manages deploying Racktables: the datacenter asset manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'

recipe 'racktables::default', 'Install from source, and setup web app'
recipe 'racktables::server', 'Setup the racktables web appliction using apache'
recipe 'racktables::source', 'Install racktables for source tarball'
recipe 'racktables::application', 'Configure the racktables application'

depends 'apache2'
