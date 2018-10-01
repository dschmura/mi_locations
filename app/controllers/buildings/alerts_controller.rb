class Building::AlertsController < AlertsController
  before_action :set_alertable

  private

    def set_alertable
      @alertable = Building.find(params[:buidling_id])
    end
end
