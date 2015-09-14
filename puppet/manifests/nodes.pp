# Node: web01.vagrant.local
node 'web01.vagrant.local' {

## Base

  # Include classes
  class {'base': }
  class {'webserver': }
}

# If a node does not match then include the base class
node 'default' {

  class {'base': }

}
