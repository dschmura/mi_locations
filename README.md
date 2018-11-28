# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


## To manually copy the csv files [where '~/code/Rails/mi_locations/uploads' is the path to the files on your machine]
'''
development_machine$ scp ~/code/Rails/mi_locations/uploads deployer@lsa-mis-rails-staging2.miserver.it.umich.edu:/home/deployer/apps/mi_locations/current/uploads
'''

## For manually importing the csv files into the db, you need to set the environment as part of the command.
'''
staging_server$ RAILS_ENV=staging bundle exec rails import:rooms
'''
* ...
