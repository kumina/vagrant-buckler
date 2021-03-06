Vagrant: Buckler
================

Description
-----------
This is an vagrant environment to test Buckler. It should support Virtualbox and libvirt. 

Installation
------------

Clone the repository 

    git clone https://github.com/kumina/vagrant-buckler.git

Install the necessary modules via [librarian-puppet](https://github.com/voxpupuli/librarian-puppet)

    cd vagrant-buckler
    librarian-puppet install --path=puppet/modules/

Spin up the environment

    vagrant up

Add the following lines to your hosts file:

    127.0.0.1 buckler.vagrant.local

If everything went as planned you should be able to login to the vagrant machine.

    vagrant ssh

Setup
-----

Once you're logged in you will need to setup the test environment.

    cd /vagrant/
    rake setupenv

Which will execute the following steps:

* Build and start the ELK environment.
* Generate and import access logs.
* Build and start Buckler (in the background).

You now have a working test environment. Credentials for buckler can be found in the configuration file.

    buckler_config.py

To list all rake tasks for managing your environment execute rake without additional options.

    rake

URLS
----

**KOPF**

    http://buckler.vagrant.local:9200/_plugin/kopf/

**Kibana**

    http://buckler.vagrant.local:5601

**Buckler**

    http://buckler.vagrant.local:8000

Author
------

Adrian van Dongen  <adrian@kumina.nl>

License
-------

    Author:: Adrian van Dongen (adrian@kumina.nl)
    Copyright:: Copyright (c) 2015 Kumina B.V.
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
