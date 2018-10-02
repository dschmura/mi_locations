class Buildings::AlertsController < AlertsController
  before_action :set_alertable

  private

    def set_alertable
      @alertable = Building.find(params[:building_id])
    end
end
