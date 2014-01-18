root = "/var/www/order_system_test/current/"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"
# listen "/tmp/unicorn.order_system.sock"
listen '127.0.0.1:8080'  # listen to port 8080 on the loopback interface
worker_processes 2
timeout 30