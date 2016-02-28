root = "/home/xaver/apps/tickets/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_stderr.log"
stdout_path "#{root}/log/unicorn_stdout.log"

listen "#{root}/.unicorn.sock"
worker_processes 1
timeout 30
