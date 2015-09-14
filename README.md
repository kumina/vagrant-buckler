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

    cd vagrant-elk
    librarian-puppet install --path=puppet/modules/

Spin up the environment

    vagrant up

Add the following lines to your hosts file:

    127.0.0.1 kibanana.vagrant.local

If everything went as planned you should be able to reach the ticking systems with 
the information supplied below.

Usage
-----

When you first start the environment you must build the docker images:

    cd /vagrant/docker/
    sudo docker build --no-cache -t="kumina/elasticsearch" elasticsearch/
    sudo docker build --no-cache -t="kumina/kibana4" kibana4/

After that you can start the docker instances: 

    sudo fig up -d

Next you will need to generate some log files to import into elasticsearch. 

    cd ../../logs
    timeout 150 ./genhttplogs.rb > customera_access.log
    timeout 150 ./genhttplogs.rb > customerb_access.log
    timeout 150 ./genhttplogs.rb > customerc_access.log

Once the log files have been generated you can import them from 

    /opt/logstash/bin/logstash agent -f /vagrant/logstash/customera_logstash.conf < /vagrant/logs/customera_access.log
    /opt/logstash/bin/logstash agent -f /vagrant/logstash/customerb_logstash.conf < /vagrant/logs/customerb_access.log
    /opt/logstash/bin/logstash agent -f /vagrant/logstash/customerc_logstash.conf < /vagrant/logs/customerc_access.log

You now have a working ELK stack.

URLS
----

**KOPF**

    http://kibana.vagrant.local:9200/_plugin/kopf/

**Kibana**

    http://kibana.vagrant.local:5601

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