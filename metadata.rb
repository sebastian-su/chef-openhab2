name 'openhab2'
maintainer 'Sebastian Sucker'
maintainer_email 'sebastian.sucker@googlemail.com'
chef_version '>= 12.1'
license 'MIT'
description 'Installs/Configures openhab2'
long_description 'Installs/Configures openhab2'
version '0.1.0'

issues_url 'https://github.com/sebastian-su/openhab2/issues' if respond_to?(:issues_url)
source_url 'https://github.com/sebastian-su/openhab2' if respond_to?(:source_url)

depends 'java'

supports 'debian'
supports 'ubuntu'
