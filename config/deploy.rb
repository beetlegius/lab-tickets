set :application, 'tickets'
set :deploy_to, "/home/xaver/apps/#{fetch(:application)}"

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :scm, :git
set :repo_url, 'ssh://git@xaver.com.ar:1843/~/tickets.git'

set :format, :pretty # :pretty :dot :black_hole :abstract
# set :log_level, :debug
set :log_level, :info
set :pty, true

set :linked_files, %w{config/database.yml config/unicorn_init.sh config/unicorn.rb config/nginx.conf}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, %w{log tmp/cache tmp/pids tmp/sockets public/assets public/dragonfly}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 2

namespace :deploy do

  ["start", "stop", "restart"].each do |comando|
    desc "#{comando} application"
    task comando do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "/etc/init.d/unicorn_#{fetch(:application)} #{comando}"
      end
    end
  end

  task :touch_pid do
    on roles(:app) do
      execute :mkdir, '-p', "#{current_path}/tmp/pids/"
      execute :touch, "#{current_path}/tmp/pids/unicorn.pid"
    end
  end

  before :publishing, :stop
  after :publishing, :start

  after :finishing, :cleanup
  after :finishing, 'nginx:restart'

  before :start, :touch_pid

end
