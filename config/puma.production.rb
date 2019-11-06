#!/usr/bin/env puma

directory "/home/deployer/apps/mi_locations/current"
rackup "/home/deployer/apps/mi_locations/current/config.ru"
environment "production"

pidfile "/home/deployer/apps/mi_locations/shared/tmp/pids/puma.pid"
state_path "/home/deployer/apps/mi_locations/shared/tmp/pids/puma.state"
stdout_redirect "/home/deployer/apps/mi_locations/current/log/puma.error.log", "/home/deployer/apps/mi_locations/current/log/puma.access.log", true

threads 4, 16

bind "unix:///home/deployer/apps/mi_locations/shared/tmp/sockets/mi_locations-puma.sock"

workers 0

preload_app!
on_restart do
  puts "Refreshing Gemfile"
  ENV["BUNDLE_GEMFILE"] = "/home/deployer/apps/mi_locations/current/Gemfile"
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
