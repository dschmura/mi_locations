source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'webpacker', github: 'rails/webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.3', require: false

# gem 'actiontext', github: 'rails/actiontext', require: 'action_text'
gem 'image_processing', '~> 1.2' # for Active Storage variants
gem 'sassc-rails'
gem 'haml-rails'
gem 'coffee-script'

gem 'active_model_serializers'
gem 'activerecord-import'
# gem 'administrate', '~> 0.8.1'
gem 'geocoder'
gem 'kaminari'
gem 'ldap_lookup'
gem 'mini_magick'
gem 'ransack'
gem 'ransack_memory'
gem 'sidekiq', '~> 5.0'
gem 'uglifier'

gem 'devise' , '~> 4.7.0'
gem 'draper'
gem 'listen'
gem 'pundit'
# gem 'gravatar_image_tag', github: 'mdeering/gravatar_image_tag'
# gem 'omniauth-facebook', '~> 4.0'
# gem 'omniauth-twitter', '~> 1.4'
# gem 'omniauth-github', '~> 1.3'
gem 'omniauth-google-oauth2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-performance'
  gem 'standard'
end

group :development do
  gem 'annotate', '~> 2.7'
  gem 'bullet'
  gem 'capistrano',         require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-postgresql'
  gem 'capistrano-rails',   require: false
  gem 'capistrano-rbenv',   require: false
  gem 'capistrano3-puma',   require: false
  gem 'erb2haml'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'pry-rails'
  gem 'terminal-notifier-guard', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'ffaker'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
