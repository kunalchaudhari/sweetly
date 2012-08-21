set_default(:smtp_email) { "kunalchaudhari@gmail.com" }
set_default(:smtp_password) { Capistrano::CLI.password_prompt "Gmail Password: " }

namespace :production do
  desc "Generate the production.rb configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config/environments"
    template "production.rb.erb", "#{shared_path}/config/environments/production.rb"
  end
  after "deploy:setup", "production:setup"

  desc "Symlink the production.rb file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
  end
  after "deploy:finalize_update", "production:symlink"
end
