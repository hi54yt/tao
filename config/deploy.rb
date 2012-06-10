set :user, "root"
set :group, "root"
set :application, "tao"
set :domain, "118.145.12.5"

#file path
set :repository,  "git@github.com:hi54yt/tao.git"
set :deploy_to, "~/tao"

role :web, "118.145.12.5"                          # Your HTTP server, Apache/etc
role :app, "118.145.12.5"                          # This may be the same as your `Web` server
role :db,  "118.145.12.5", :primary => true # This is where Rails migrations will run

set :deploy_via, :remote_cache
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :deploy_env, "development"
set :rails_env, "development"

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=development"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
  task :bundle_install, :roles => :app do
    run "cd #{release_path} && bundle install"
  end


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end