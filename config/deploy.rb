# config valid only for Capistrano 3.1
# require 'capistrano/rvm'
# require "capistrano/setup"
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
# require 'capistrano/bundler'


lock '3.1.0'
set :application, 'order_system'
set :repo_url, 'https://github.com/sczy/Order_system.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# set :user, 'admin'
set :use_sudo, false
set :branch, "work"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/order_system'

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
set :unicorn_config, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, '#{deploy_to}/current/tmp/pids/unicorn.pid'

set :rvm_ruby_version, ' 2.0.0@rails402' 

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
    on roles(:all), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      within current_path do
        execute :bundle, 'exec unicorn_rails -c /var/www/order_system/current/config/unicorn.rb -D -E production'
        execute :bundle, "exec whenever -i"
        execute :bundle, 'exec script/delayed_job start RAILS_ENV=development'
      end
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
end

namespace :order_unicorn do
  task :start do
    on roles(:app), in: :sequence, wait: 5, :except => { :no_release => true } do
      within current_path do
        execute :bundle, :exec, :unicorn_rails, "-c #{fetch(:unicorn_config)} -D -E #{fetch(:rails_env, 'production')}"
      end
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 5, :except => { :no_release => true } do
      execute "kill -QUIT $(cat /var/www/order_system/current/tmp/pids/unicorn.pid)"
    end
  end

  task :restart do
    on roles(:app), in: :sequence, wait: 5, :except => { :no_release => true } do
      execute "kill -s USR2 $(cat /var/www/order_system/current/tmp/pids/unicorn.pid)"
    end
  end

end


namespace :order_whenver do
  task :update do
    on roles(:all), in: :sequence, wait: 5 do
      within current_path do
        execute :bundle, "exec whenever -i"
      end
    end
  end
end

namespace :order_delayed_job do
  task :start do
    on roles(:all), in: :sequence, wait: 5 do
      within current_path do
       execute :bundle, 'exec script/delayed_job start RAILS_ENV=development'
      end
    end
  end
  
  task :stop do
    on roles(:all), in: :sequence, wait: 5 do
      within current_path do
       execute :bundle, 'exec script/delayed_job stop RAILS_ENV=development'
      end
    end
  end
end