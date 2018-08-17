require 'csv'
require 'benchmark'
require 'buildings_importer'
require 'rooms_importer'
require 'room_characteristics_importer'
require 'room_contacts_importer'

namespace :import do

  desc "Import Buildings from CSV"
  task buildings: :environment do
    time = Benchmark.measure do
      BuildingsImporter.new.import('uploads/buildings.csv')
    end
    puts "Buildings Time: #{time}"
  end

  desc "Import Rooms from CSV file"
  task :rooms => [:environment] do
    time = Benchmark.measure do
    RoomsImporter.new.import_rooms
    end
    puts "Rooms Time: #{time}"
  end

  desc "Import Room Characteristics from CSV file"
  task :room_characteristics => [:environment] do
    time = Benchmark.measure do
    RoomCharacteristicsImporter.new
    end
    puts "Room Characteristics Time: #{time}"
  end

  desc "Import Room Contacts from CSV file"
  task :room_contacts => [:environment] do
    time = Benchmark.measure do
    RoomContactsImporter.new
    end
    puts "Room Contacts Time: #{time}"
  end
end
