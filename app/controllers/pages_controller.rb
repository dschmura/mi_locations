class PagesController < ApplicationController

  skip_before_action :redirect_https
  skip_after_action :verify_policy_scoped, only: :index
  def index

    @q = Room.classrooms.ransack(params[:q])

  end

  def about
    authorize :page

  end

  def contact
    authorize :page
  end

  def privacy
    authorize :page
  end

  def project_status
    authorize :page
  end
end
