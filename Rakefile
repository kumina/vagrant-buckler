namespace :docker do

  desc 'Start docker environment'
  task :start do
    system "sudo docker-compose -f /vagrant/docker-compose.yml up -d"
  end

  desc 'Stop docker environment'
  task :stop do
    system "sudo docker-compose -f /vagrant/docker-compose.yml stop"
  end

  desc 'Restart docker environment'
  task :restart do
    system "sudo docker-compose -f /vagrant/docker-compose.yml restart"
  end
end

namespace :indexes do

  desc 'Generate and import indexes'
  task :generate do
    system 'makelogs -c 1500 -d "0,-12" -localhost:9200 --indexPrefix customera- --verbose'
    system 'makelogs -c 1500 -d "0,-12" -localhost:9200 --indexPrefix customerb- --verbose'
    system 'makelogs -c 1500 -d "0,-12" -localhost:9200 --indexPrefix customerc- --verbose'
  end

  desc 'Purge indexes'
  task :purge do
    system "curl -XDELETE 'http://localhost:9200/customera-*/'"
    system "curl -XDELETE 'http://localhost:9200/customerb-*/'"
    system "curl -XDELETE 'http://localhost:9200/customerc-*/'"
  end

  desc 'List indexes (full)'
  task :listfull do
    system "curl -XGET 'http://localhost:9200/_all?pretty'"
  end

  desc 'List indexes (short)'
  task :listshort do
    system "curator --host localhost show indices --timestring %Y.%m.%d"
  end

  desc 'List indexes older than 10 days'
  task :listold do
    system "curator --host localhost show indices --timestring %Y.%m.%d --time-unit days --older-than 10"
  end

  desc 'Close indexes older than 10 days'
  task :close do
    system "curator --host localhost close indices --timestring %Y.%m.%d --time-unit days --older-than 10"
  end

  desc 'Open all indexes'
  task :open do
    system "curator --host localhost open indices --all-indices"
  end

  desc 'Open indexes older than 10 days'
  task :openold do
    system "curator --host localhost open indices --timestring %Y.%m.%d --time-unit days --older-than 10"
  end
end

namespace :kibanana do

  desc 'Build kibanana'
  task :build do
    system "git clone https://git.kumina.nl/kibanana/kibanana-project.git src/kibanana-project"
    system "virtualenv --system-site-packages src/kibanana-project/"
    system "sed -i 's\/git@git.kumina.nl:\/https:\\/\\/git.kumina.nl\\/\/' src/kibanana-project/buildout.cfg"
    system "src/kibanana-project/bin/pip install zc.buildout && src/kibanana-project/bin/buildout -c src/kibanana-project/development.cfg"
    system "cp /vagrant/kibanana_config.py src/kibanana-project/Kibanana/settings/config.py"
  end

  desc 'Start kibanana'
  task :start do
    system "src/kibanana-project/bin/django runserver 0.0.0.0:8000 > src/kibanana_output.log 2>&1 &"
  end

  desc 'Stop kibanana'
  task :stop do
    system "ps aux | grep django | grep -v grep | awk {'print $2'} | xargs kill"
  end
end

task :default => :usage

desc 'Show usage'
task :usage do
  system "rake -T"
end

desc 'Setup test environment'
task :setupenv => [ 'docker:start', 'indexes:generate', 'kibanana:build', 'kibanana:start']
