task :default => :show_usage

desc 'Show usage'
task :show_usage do
  system "rake -T"
end

desc 'Setup test environment'
task :setup_env_test => [ :docker_start, :indexes_generate]

desc 'Start docker environment'
task :docker_start do
  system "sudo docker-compose -f /vagrant/docker-compose.yml up -d"
end

desc 'Stop docker environment'
task :docker_stop do
  system "sudo docker-compose -f /vagrant/docker-compose.yml stop"
end

desc 'Restart docker environment'
task :docker_restart do
  system "sudo docker-compose -f /vagrant/docker-compose.yml restart"
end

desc 'Generate and import indexes'
task :indexes_generate do
  system "LOGS=`timeout 15 /vagrant/logs/genhttplogs.rb` echo $LOGS | /opt/logstash/bin/logstash agent -f /vagrant/logs/customera_logstash.conf"
  system "LOGS=`timeout 15 /vagrant/logs/genhttplogs.rb` echo $LOGS | /opt/logstash/bin/logstash agent -f /vagrant/logs/customerb_logstash.conf"
  system "LOGS=`timeout 15 /vagrant/logs/genhttplogs.rb` echo $LOGS | /opt/logstash/bin/logstash agent -f /vagrant/logs/customerc_logstash.conf"
end

desc 'Purge indexes'
task :indexes_purge do
    system "curl -XDELETE 'http://localhost:9200/customera-2015.09.15/'"
    system "curl -XDELETE 'http://localhost:9200/customerb-2015.09.15/'"
    system "curl -XDELETE 'http://localhost:9200/customerc-2015.09.15/'"
end

desc 'List indexes'
task :indexes_list do
  system "curl -XGET 'http://localhost:9200/_all?pretty'"
end
