namespace :apache do
  desc "Install latest stable release of apache2"
  task :install, roles: :web do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install apache2"
  end
  after "deploy:install", "apache:install"

  desc "Setup apache2 configuration for this application"
  task :setup, roles: :web do
    template "apache_unicorn.erb", "/tmp/apache_conf"
    run "#{sudo} mv /tmp/apache_conf /etc/apache/sites-enabled/#{application}"
    run "#{sudo} rm -f /etc/apache/sites-enabled/default"
    restart
  end
  after "deploy:setup", "apache:setup"
  
  %w[start stop restart].each do |command|
    desc "#{command} apache"
    task command, roles: :web do
      run "#{sudo} service apache2 #{command}"
    end
  end
end
