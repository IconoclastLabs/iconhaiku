require 'bundler/capistrano'

# This capistrano deployment recipe is made to work with the optional
# StackScript provided to all Rails Rumble teams in their Linode dashboard.
#
# After setting up your Linode with the provided StackScript, configuring
# your Rails app to use your GitHub repository, and copying your deploy
# key from your server's ~/.ssh/github-deploy-key.pub to your GitHub
# repository's Admin / Deploy Keys section, you can configure your Rails
# app to use this deployment recipe by doing the following:
#
# 1. Add `gem 'capistrano'` to your Gemfile.
# 2. Run `bundle install --binstubs --path=vendor/bundles`.
# 3. Run `bin/capify .` in your app's root directory.
# 4. Replace your new config/deploy.rb with this file's contents.
# 5. Configure the two parameters in the Configuration section below.
# 6. Run `git commit -a -m "Configured capistrano deployments."`.
# 7. Run `git push origin master`.
# 8. Run `bin/cap deploy:setup`.
# 9. Run `bin/cap deploy:migrations` or `bin/cap deploy`.
#
# Note: When deploying, you'll be asked to enter your server's root
# password. To configure password-less deployments, see below.

#############################################
##                                         ##
##              Configuration              ##
##                                         ##
#############################################

#GITHUB_REPOSITORY_NAME = 'r12-team-223'
LINODE_SERVER_HOSTNAME = "198.58.101.71"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa.bowser-deployer")]
default_run_options[:pty] = true
#############################################
#############################################

# General Options

set :bundle_flags,               "--deployment"

set :application,                "iconhaiku"
set :deploy_to,                  "/var/www/apps/iconhaiku"
set :normalize_asset_timestamps, false
set :rails_env,                  "production"

set :user,                       'deployer'
set :runner,                     "deployer"
set :admin_runner,               "deployer"

# Password-less Deploys (Optional)
#
# 1. Locate your local public SSH key file. (Usually ~/.ssh/id_rsa.pub)
# 2. Execute the following locally: (You'll need your Linode server's root password.)
#
#    cat ~/.ssh/id_rsa.pub | ssh root@LINODE_SERVER_HOSTNAME "cat >> ~/.ssh/authorized_keys"
#
# 3. Uncomment the below ssh_options[:keys] line in this file.
#
# ssh_options[:keys] = ["~/.ssh/id_rsa"]

# SCM Options
set :scm,        :git
set :repository, "git@bitbucket.org:iconoclastlabs/iconhaiku.git"
set :branch,     "master"

# Roles
role :app, LINODE_SERVER_HOSTNAME
role :db,  LINODE_SERVER_HOSTNAME, :primary => true

# Add Configuration Files & Compile Assets
after 'deploy:update_code' do
  # Setup Configuration
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"

  # Compile Assets
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

# Restart Passenger
deploy.task :restart, :roles => :app do
  # Fix Permissions
  #sudo "chown -R deployer:deployer #{current_path}"
  #sudo "chown -R deployer:deployer #{latest_release}"
  #sudo "chown -R deployer:deployer #{shared_path}/bundle"
  #sudo "chown -R deployer:deployer #{shared_path}/log"

  # Restart Application
  run "touch #{current_path}/tmp/restart.txt"
end
