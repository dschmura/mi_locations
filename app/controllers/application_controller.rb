class ApplicationController < ActionController::Base
  include RansackMemory::Concern
  before_action :create_feedback
  before_action :save_and_load_filters

  private
  def sign_up_params
    params.require(:user).permit(:uniqname, :email, :password, :password_confirmation)
  end
  def account_update_params
    params.require(:user).permit(:uniqname, :email, :password, :password_confirmation, :current_password)
  end
  def create_feedback
    @feedback = Feedback.new
  end

end
