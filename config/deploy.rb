# config valid only for Capistrano 3.1
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

lock '3.1.0'
set :application, 'order_system_test'
set :repo_url, 'https://github.com/sczy/Order_system.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# set :user, 'admin'
set :use_sudo, false
set :branch, "work"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/order_system_test'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true
set :tmp_dir, deploy_to

set :rails_env, :production
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"

set :bundle_flags, '--system --quiet'
# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  # task :bundle_install do
#     on roles(:app) do
#       run "cd #{deploy_to}/current && bundle install"
#     end
#   end
#   after :finished, :bundle_install

end
