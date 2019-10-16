class PagesController < ApplicationController

  skip_filter :redirect_https

  def index

    @q = Room.classrooms.ransack(params[:q])
    @rooms = policy_scope(@q.result(distinct: true).includes(:building, :room_characteristics).page(params[:page]))

    respond_to do |format|
      format.html
      format.json { render json: @rooms }
      format.js
    end
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
