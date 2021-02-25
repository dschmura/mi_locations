server "lsa-mis-rails-staging2.miserver.it.umich.edu", user: "deployer", roles: %w[app db web]
# set :stage, :staging
set :branch, :main
set :deploy_user, "deployer"
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/mi_locations"
set :rails_env, "staging"
set :puma_env, "staging"
set :puma_conf, "#{shared_path}/config/puma.rb"
