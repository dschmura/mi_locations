class ApplicationController < ActionController::Base
  include RansackMemory::Concern
  before_action :create_feedback
  before_action :save_and_load_filters

  private

  def create_feedback
    @feedback = Feedback.new
  end
end
