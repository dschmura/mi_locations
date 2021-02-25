server "mi-locations-production.miserver.it.umich.edu", user: "deployer", roles: %w[app db web]
# server "mi_locations.com", user: 'deployer', roles: %w{app db web}
# set :stage, :production
set :branch, :main
set :deploy_user, "deployer"
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/mi_locations"
set :rails_env, "production"
set :puma_env, "production"
set :puma_conf, "#{shared_path}/config/puma.rb"
