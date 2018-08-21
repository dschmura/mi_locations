class BuildingsController < ApplicationController
  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result.page
  end

  def show
  end
end
