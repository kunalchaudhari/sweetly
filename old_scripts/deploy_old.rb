require File.expand_path('../cap_db', __FILE__)

set :application, "sweetly"
set :repository,  "git@github.com:kunalchaudhari/sweetly.git"

set :user, :app
set :use_sudo, false

#set :deploy_via, :remote_cache

set :port, 22

set :default_environment, { 'PATH' => "/home/app/.rbenv/shims:/home/app/.rbenv/bin:$PATH" }

set :scm, :git
ssh_options[:forward_agent] = true

role :app, "178.79.166.34"
role :web, "178.79.166.34"
role :db,  "178.79.166.34", :primary => true

set(:bundle_cmd) { "#{release_path}/bin/bundle" }
after 'deploy:update_code', 'bundle:install'
# after 'deploy:update_code', 'bundle:update'
namespace :bundle do
  task :install do
    run "#{bundle_cmd} install --gemfile #{release_path}/Gemfile --path #{shared_path}/bundle --deployment"
  end
  
  task :update do
    run "#{bundle_cmd} update --gemfile #{release_path}/Gemfile --path #{shared_path}/bundle --deployment"
  end
end

set :asset_env, "RAILS_GROUPS=assets"
set :assets_prefix, "assets"
set :rails_env, :production
set :unicorn_binary, "bin/unicorn"
set :unicorn_config, "config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

before 'deploy:finalize_update', 'deploy:assets_symlink'
after 'deploy:update_code', 'deploy:assets_precompile'

namespace :deploy do

  task :migrate, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && bin/rake db:migrate RAILS_ENV=#{rails_env}"
  end

  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end

  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

  desc <<-DESC
    [internal] This task will set up a symlink to the shared directory \
    for the assets directory. Assets are shared across deploys to avoid \
    mid-deploy mismatches between old application html asking for assets \
    and getting a 404 file not found error. The assets cache is shared \
    for efficiency. If you cutomize the assets path prefix, override the \
    :assets_prefix variable to match.
  DESC
  task :assets_symlink, :roles => :web, :except => { :no_release => true } do
    run <<-CMD
      rm -rf #{latest_release}/public/#{assets_prefix} &&
      mkdir -p #{latest_release}/public &&
      mkdir -p #{shared_path}/assets &&
      ln -s #{shared_path}/assets #{latest_release}/public/#{assets_prefix}
    CMD
  end

  desc <<-DESC
    Run the asset precompilation rake task. You can specify the full path \
    to the rake executable by setting the rake variable. You can also \
    specify additional environment variables to pass to rake via the \
    asset_env variable. The defaults are:

      set :rake,      "rake"
      set :rails_env, "production"
      set :asset_env, "RAILS_GROUPS=assets"
  DESC
  task :assets_precompile, :roles => :web, :except => { :no_release => true } do
    from = source.next_revision(current_revision)
    if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
      run "cd #{latest_release} && #{latest_release}/bin/rake RAILS_ENV=#{rails_env} #{asset_env} assets:precompile"
    else
      logger.info "Skipping asset pre-compilation because there were no asset changes"
    end
  end

  namespace :nginx do

    desc "copies nginx.conf to shared path"
    task :setup, :roles => :web, :except => { :no_release => true } do
      default_template = ''
      location = 'config/deploy/nginx.conf.erb'
      template = File.file?(location) ? File.read(location) : default_template

      config = ERB.new(template)

      run "mkdir -p #{shared_path}/config" 
      put config.result(binding), "#{shared_path}/config/nginx.conf"
      run "sudo ln -nfs #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    end
  end

  namespace :apache do

    desc "copies apache.conf to shared path"
    task :setup, :roles => :web, :except => { :no_release => true } do
      default_template = ''
      location = 'config/deploy/apache.conf.erb'
      template = File.file?(location) ? File.read(location) : default_template

      config = ERB.new(template)

      run "mkdir -p #{shared_path}/config" 
      put config.result(binding), "#{shared_path}/config/apache.conf"
    end

  end

end

