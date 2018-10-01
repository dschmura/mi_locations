class AlertsController < ApplicationController

  def create
    @alert = @alertable.alerts.new(alert_params)
    if @alert.save
      redirect_to @alertable, notice: 'Your Alert was successfully created.'
    else
      flash[:flash] = 'Alert Not Created!'
      redirect_to :back
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alertable = @alert.alertable
    if @alert.destroy
      flash[:success] = 'Alert Destroyed!'
      redirect_to :back
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:severity, :message, :start_date, :end_date, :alertable_type, :alertable_id)
  end
end
