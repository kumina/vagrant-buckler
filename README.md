Vagrant: Kibanana
================

Description
-----------
This is an vagrant environment to test Kibanana

Installation
------------

Clone the repository 

    git clone git@git.kumina.nl:kibanana/vagrant-kibanana.git

Install the necessary modules via [librarian-puppet](https://github.com/rodjek/librarian-puppet)

    cd vagrant-kibanana
    librarian-puppet install --path=puppet/modules/

Spin up the environment

    vagrant up

Add the following lines to your hosts file:

    127.0.0.1 kibanana.vagrant.local

If everything went as planned you should be able to login to the vagrant machine.

    vagrant ssh

Usage
-----

Once you're logged in you will need to setup the test environment. This will start the ELK environment,
generate access logs and import them to elasticsearch. 

    cd /vagrant/
    rake setup_env_test

You now have a working ELK stack. For more rake tasks execute rake

    rake

URLS
----

**KOPF**

    http://kibanana.vagrant.local:9200/_plugin/kopf/

**Kibana**

    http://kibanana.vagrant.local:5601

**Kibanana**

    http://kibanana.vagrant.local:8000

Todo
------

- Add documentation for kibanana

Author
------

Adrian van Dongen  <adrian@kumina.nl>

License
-------

    Author:: Adrian van Dongen (adrian@kumina.nl)
    Copyright:: Copyright (c) 2015 Adrian van Dongen
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
