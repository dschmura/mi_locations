class Rooms::AlertsController < AlertsController
  before_action :set_alertable

  private

    def set_alertable
      @alertable = Room.find(params[:room_id])
    end
end
