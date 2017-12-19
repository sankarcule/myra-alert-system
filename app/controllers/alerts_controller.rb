class AlertsController < ApplicationController
  before_action :set_alert, only: [:destroy]

  # Returns the list of alerts
  #
  # @response_class Array<AlertSerializer>
  def index
    @alerts = Alert.all
    json_response(@alerts)
  end

  # Create Alert
  #
  # @query_parameter [integer] reference_id
  # @query_parameter [integer] delay
  # @query_parameter [string] description
  #
  def create
    @alert = Alert.create!(alert_params)
    json_response(@alert, :created)
  end

  # Delete Alert
  #
  #
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
