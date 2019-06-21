class PagesController < ApplicationController
  def index
    @q = Room.classrooms.ransack(params[:q])
    @rooms = @q.result(distinct: true).includes(:building, :room_characteristics).page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @rooms }
      format.js
    end
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
