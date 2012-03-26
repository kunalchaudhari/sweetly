require File.expand_path('../cap_db', __FILE__)
require "bundler/capistrano"

set :application, "sweetly"
set :repository,  "git@github.com:kunalchaudhari/sweetly.git"

set :user, :app
set :use_sudo, false

set :port, 30000

#set :default_environment, {
  #'PATH' => "/home/app/.rbenv/shims:/home/app/.rbenv/bin:$PATH"
#}

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
ssh_options[:forward_agent] = true

role :app, "192.168.1.18"
role :web, "192.168.1.18"
role :db,  "192.168.1.18", :primary => true

namespace :deploy do
  #desc "Installs required gems binstubs"
  #task :gems, :roles => :app do
    #run "cd #{current_path} && bundle install --binstubs"
  #end
  
  desc "Precompile assets"
  task :precompile_assets do
    run "cd #{current_path} && bundle exec rake assets:precompile"
  end
end
