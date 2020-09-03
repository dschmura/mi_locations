class ApplicationController < ActionController::Base
  include Pundit
  include LdapableHelper
  include Pagy::Backend
  before_action :store_user_location!, if: :storable_location?
  before_action :redirect_to_legacy
  before_action :redirect_https
  before_action :create_feedback
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
  # before_action :flash_dance
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def flash_dance
    flash[:alert] = "This site is for demo purposes only. Please use the legacy classroom database system at https://rooms.lsa.umich.edu"
  end

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

  def user_not_authorized
    flash[:alert] = "Please sign in to perform this action."
    redirect_back(fallback_location: :user_google_oauth2_omniauth_authorize)
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def redirect_to_legacy
    redirect_to "https://rooms.lsa.umich.edu" unless Rails.env.development? || Rails.env.staging?
  end

  def redirect_https
    @ip = request.remote_ip
    redirect_to user_google_oauth2_omniauth_authorize_path unless user_signed_in? || @ip.match(/141.211.|141.212.|141.213.|141.214.|141.215.|35.1.|35.2.|35.3.|67.194.|192.168.1.|127.0.0.1|::1/)
    true
  end
end
