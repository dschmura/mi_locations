class AlertsController < ApplicationController
  before_action :load_alertable
  def new
    @alert = Alert.new
    authorize @alert
  end

  def edit
    authorize @alert
  end

  def create
    @alert = @alertable.alerts.new(alert_params)
    authorize @alert

    if @alert.save
      redirect_to @alertable, notice: "Your Alert was successfully created."
    else
      flash[:alert] = "Alert Not Created!"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @alert = Alert.find(params[:id])
    authorize @alert
    @alertable = @alert.alertable
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_back(fallback_location: root_path, notice: "alert was successfully updated.") }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    authorize @alert
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
    resource, id = request.path.split("/")[1, 2]
    @alertable = resource.singularize.classify.constantize.find(id)
  end
end
