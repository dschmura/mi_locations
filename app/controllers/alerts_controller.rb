class AlertsController < ApplicationController
  before_action :load_alertable
  def new
    @alert = Alert.new
  end

  def edit

  end

  def create
    @alert = @alertable.alerts.new(alert_params)
    if @alert.save
      redirect_to @alertable, notice: "Your Alert was successfully created."
    else
      flash[:alert] = "Alert Not Created!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alertable = @alert.alertable
    if @alert.destroy
      flash[:alert] = "Alert Destroyed!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:severity, :message, :start_date, :end_date, :alertable_type, :alertable_id)
  end

  def load_alertable
    resource, id = request.path.split('/')[1,2]
    @alertable = resource.singularize.classify.constantize.find(id)
  end
end
