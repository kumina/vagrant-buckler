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

Setup
-----

Once you're logged in you will need to setup the test environment. This will start the ELK environment,
generate access logs and import them to elasticsearch. 

    cd /vagrant/
    rake setup_env_test

You now have a working ELK stack. For more rake tasks execute rake

    rake

Kibanana
--------

You can now setup the kibanana development environment. Note: you will be asked for your credentials.

    mkdir src && cd src/
    git clone https://git.kumina.nl/kibanana/kibanana-project.git
    virtualenv --system-site-packages kibanana-project

Because you have no access to your ssh keys from this environment we need to change the connection method
from git to https.

    sed -i 's/git@git.kumina.nl:/https:\/\/git.kumina.nl\//' kibanana-project/buildout.cfg

Now install zc.buildout and run buildout. Note: you will be asked for your credentials.

    cd kibanana-project && bin/pip install zc.buildout && bin/buildout -c development.cfg

Copy the configuration file.

    cp /vagrant/kibanana_config.py Kibanana/settings/config.py

And start the kibanana instance.

    bin/django runserver 0.0.0.0:8000

You can now start testing Kibanana. The credentials are in the configuration file.

    /vagrant/src/kibanana-project/Kibanana/settings/config.py

URLS
----

**KOPF**

    http://kibanana.vagrant.local:9200/_plugin/kopf/

**Kibana**

    http://kibanana.vagrant.local:5601

**Kibanana**

    http://kibanana.vagrant.local:8000

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