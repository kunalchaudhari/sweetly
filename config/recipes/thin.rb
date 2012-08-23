set_default(:thin_user) { user }
set_default(:thin_pid) { "#{current_path}/tmp/pids/thin.pid" }
set_default(:thin_config) { "#{shared_path}/config/thin.yml" }
set_default(:thin_log) { "#{shared_path}/log/thin.log" }

namespace :thin do
  desc "Setup thin initializer and app configuration"
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "thin.yml.erb", thin_config
    template "thin_init.erb", "/tmp/thin_init"
    run "chmod +x /tmp/thin_init"
    run "#{sudo} mv /tmp/thin_init /etc/init.d/thin_#{application}"
    run "#{sudo} update-rc.d -f thin_#{application} defaults"
  end
  after "deploy:setup", "thin:setup"

  %w[start stop restart].each do |command|
    desc "#{command} thin"
    task command, roles: :app do
      run "service thin_#{application} #{command}"
    end
    after "deploy:#{command}", "thin:#{command}"
  end
end
