# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

## You must have ImageMagick or GraphicsMagick installed
```
server$ sudo apt-get update
## If dependencies are not yet installed
server$ sudo apt-get install build-essential checkinstall libx11-dev libxext-dev zlib1g-dev libpng12-dev libjpeg-dev libfreetype6-dev libxml2-dev

server$ cd /opt
server$ sudo wget http://www.imagemagick.org/download/ImageMagick.tar.gz
server$ sudo tar xvzf ImageMagick.tar.gz
server$ cd ImageMagick-7.0.9-4/
server$ sudo touch configure
server$ sudo ./configure
server$ sudo make
server$ sudo make install
server$ sudo ldconfig /usr/local/lib
server$ sudo make check

# Test that the installation was successful
server$ convert --version

# Clean up

server$ cd /opt
server$ sudo rm -rf ImageMagick*
```

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
server$ RAILS_ENV=staging bundle exec rails import:rooms
'''
* ...

## Download panoramas from the [MGIS System](https://umich.app.box.com/folder/28483326629)
## Move all .jpg images in all the directories into one directory
```
development_machine$ mv /path_to_downloaded_panoramas/**/*.jpg /path_to_downloaded_panoramas/panos

```

## To upload panoramas to the server, use rsync

```
development_machine$  ~/Downloads/College\ of\ Literature,\ Science,\ and\ the\ Arts/ deployer@mi-locations-production.miserver.it.umich.edu:/home/deployer/apps/mi_locations/shared/uploads/panos
```


## Set visability for rooms based on old rooms.lsa.umich.edu system.
### Get an array of rmrecnbrs for visible rooms from the rails console on the production server.
```
visible_classrooms = Classroom.joins(:location).where(:locations => {visible: true}).map { |room| room.rmrecnbr }
```

### Just copy the array into a variable on the NEW production server