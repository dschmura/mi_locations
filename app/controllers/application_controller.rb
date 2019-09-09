class ApplicationController < ActionController::Base
  include Pundit
  include RansackMemory::Concern
  before_action :create_feedback
  before_action :save_and_load_filters
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index


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

  # def current_user
  #   super || OpenStruct.new(uniqname: 'guest', email: 'guest@localhost.com')
  # end

end
