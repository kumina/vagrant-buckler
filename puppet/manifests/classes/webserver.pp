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

## Fig

  # Fig for docker control.
  include 'fig'

## Elasticdump

  # Install NodeJS and MPM for elasticdump.
  class { '::nodejs':
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }

  # Install elasticdump
  package { 'elasticdump':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['::nodejs']
  }

## Logstash

  # Add logstash repo.
  apt::source { 'logstash':
    location => 'http://packages.elasticsearch.org/logstash/1.5/debian',
    release  => 'stable',
    repos    => 'main',
    key        => {
      'id'     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
      'server' => 'pgp.mit.edu',
    },
  }

  # Install java/OpenJDK for logstash.
  package{ 'openjdk-8-jre':
    ensure => present,
  }

  # Install logstash.
  package{ 'logstash':
    ensure  => present,
    require => [Package['openjdk-7-jre'], Apt::Source['logstash']]
  }

## Kibanana

  # Kibanana dependencies 
  $kibanana_dep_pkgs = ['python-pip', 'python-virtualenv']
  package{ $kibanana_dep_pkgs:
    ensure => present,
  }

}