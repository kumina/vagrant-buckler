# Class webserver
#
# This class handles the installation and configuration of a webserver
#
# Author
#   Adrian van Dongen adrian@kumina.nl
#
# Version
#   0.1   Initial release
#
# Parameters:
#   None
#
# Requires:
#   - puppetlabs/apache
#
# Sample Usage:
#
#   # Include base class
#   class {'webserver': }
#
class webserver {

## Docker compose
  class { 'docker_compose':
    version => '1.2.0'
  }

## Elasticdump

  # Install NodeJS and MPM for elasticdump.
  class { '::nodejs':
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }

  file { '/usr/bin/node':
    ensure => link,
    target => '/usr/bin/nodejs',
  }

  # Install elasticdump
  package { 'elasticdump':
    ensure   => 'present',
    provider => 'npm',
    require  => [ Class['::nodejs'], File['/usr/bin/node'], ]
  }

  # Install makelogs
  package { 'makelogs':
    ensure   => 'present',
    provider => 'npm',
    require  => [ Class['::nodejs'], File['/usr/bin/node'], ]
  }

## Kibanana

  # Kibanana dependencies 
  $kibanana_dep_pkgs = ['python-pip', 'python-virtualenv']
  package{ $kibanana_dep_pkgs:
    ensure => present,
  }

## Rake

  # Install Rake
  package { 'rake':
    ensure   => 'present',
  }
}
