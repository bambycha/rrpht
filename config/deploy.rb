# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'rr_01'
set :deploy_user, 'ubuntu'

# setup repo details
set :scm, :git
set :repo_url, 'git@github.com:bambycha/rrpht.git'

set :rvm_ruby_version, 'ruby-head@rr'

# how many old releases do we want to keep
set :keep_releases, 5

# files we want symlinking to specific entries in shared.
set :linked_files, %w{config/database.yml}

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  nginx.conf
  database.yml
  unicorn.rb
  unicorn_init.sh
  application.yml
))

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
  }
])

namespace :deploy do
  # make sure we're deploying what we think we're deploying
  after :finishing, 'deploy:cleanup'

  # remove the default nginx configuration as it will tend
  # to conflict with our configs.
  before 'deploy:setup', 'nginx:remove_default_vhost'

  # reload nginx to it will pick up any modified vhosts from
  # setup_config
  after 'deploy:setup', 'nginx:reload'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'
end