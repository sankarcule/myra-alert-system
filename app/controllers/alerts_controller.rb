class AlertsController < ApplicationController
  before_action :set_alert, only: [:destroy]

  def index
    @alerts = Alert.all
    json_response(@alerts)
  end

  def create
    @alert = Alert.create!(alert_params)
    json_response(@alert, :created)
  end

  def destroy
    @alert.destroy
    head :no_content
  end


  private

  def alert_params
    params.permit(:reference_id, :delay, :description)
  end

  def set_alert
    @alert = Alert.find(params[:id])
  end
end
