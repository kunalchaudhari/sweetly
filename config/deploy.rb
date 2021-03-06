require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/mysql"
load "config/recipes/unicorn"
load "config/recipes/thin"
load "config/recipes/production" #setup production.rb - task to set SMTP settings
load "config/recipes/check"

server "178.79.166.34", :web, :app, :db, :primary => true

set :application, "sweetly"
set :user, "app"
set :use_sudo, false
#set :deploy_via, :remote_cache
set :default_environment, { 'PATH' => "/home/app/.rbenv/shims:/home/app/.rbenv/bin:$PATH" }

set :scm, :git
set :repository,  "git@github.com:kunalchaudhari/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :bundle_cmd, "#{release_path}/bin/bundle"
set :rake, "#{release_path}/bin/rake"

after "deploy", "deploy:cleanup" # keep only the last 5 releases
