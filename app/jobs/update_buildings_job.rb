class UpdateBuildingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    MiLocations::Application.load_tasks
    # Rake::Task['import:buildings'].invoke
    Rake::Task["import:buildings"].execute
  end
end
