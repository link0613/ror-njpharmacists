require "bundler/capistrano"

set :application, "njpha_site"

set :shared_children, shared_children + %w{public/system}

set :user, "njpha"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]
set :use_sudo, true

set :scm, "git"
set :repository,  "ssh://git@bitbucket.org/binarydev/njpha-website.git"
set :git_shallow_clone, 1
set :scm_verbose, true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

server "SERVER IP HERE", :web, :app, :db, primary: true
set :rails_env, 'production'
set :port, 22
set :branch, "master"

# add binstubs in app/bin directory
set :bundle_flags, '--deployment --quiet --binstubs'

# set up the environment for rbenv since Capistrano
# doesn't execute .profile (so it needs rbenv's $PATH)
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  # Passenger

  task :start do
    run "#{try_sudo} service nginx start"
  end
  
  task :stop do
    run "#{try_sudo} service nginx stop"
  end
  
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  

#REMOVE OR COMMENT OUT THIS NAMESPACE WHEN DOING A COLD DEPLOY AS IT CAUSES A CRASH
#  only update assets that have changed
  # namespace :assets do
  #   task :precompile, roles: :web, except: { no_release: true } do
  #     from = source.next_revision(current_revision)
  #     if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #     else
  #       logger.info "Skipping asset pre-compilation because there were no asset changes"
  #     end
  #   end
  # end
  
  task :seed do
    desc "Seeding the database"
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
  
  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/#{branch}`
      puts "WARNING: HEAD is not the same as origin/#{branch}"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
  
end
