set :application, "wmd"
set :domain, "domain name/IP"
set :user, "username of server"
set :password, "password of server"
set :scm_username, 'averma'
set :rails_env, "production"
set :scm, :git
set :repository, "git@github.com:averma/wmd.git"
set :deploy_to, "deploy path of server"
set :use_sudo, false
set :chmod755, "app config db lib vendor script script/* public"
set :keep_releases, "5" # number of deployed releases to keep
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
default_run_options[:pty] = true
ssh_options[:keys] = %w(~/.ssh/id_rsa)
ssh_options[:forward_agent] = true
role :app, domain
role :web, domain
role :db,  domain, :primary => true
namespace :deploy do
  task :restart, :roles => :app do
    run "cp #{current_path}/config/server.database.yml #{current_path}/config/database.yml"
    run "cd #{current_path} && chmod -R 755 #{chmod755}"
    run "touch #{current_path}/tmp/restart.txt"
  end
end
after :deploy, "deploy:restart"
