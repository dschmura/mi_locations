class ImportRoomCharacteristicsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    MiLocations::Application.load_tasks
    # Rake::Task['import:buildings'].invoke
    Rake::Task["import:room_characteristics"].execute
  end
end

# ImportRoomCharacteristicsJob.perform_later
