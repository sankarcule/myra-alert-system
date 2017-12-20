class AlertsController < ApplicationController
  before_action :set_alert, only: [:revoke]

  # Returns the list of alerts
  #
  # @response_class Array<AlertSerializer>
  def index
    @alerts = Alert.all
    json_response(@alerts)
  end

  # Create Alert
  #
  # @query_parameter [string] reference_id
  # @query_parameter [integer] delay
  # @query_parameter [string] description
  #
  def create
    @alert = Alert.create!(alert_params)
    json_response(@alert, :created)
  end

  # Delete Alert
  #
  # @query_parameter [string] reference_id
  #
  def revoke
    begin
      unless @alert.try(:delay) < 60 || @alert.try(:delay) > 500
        @alert.destroy
      end
    rescue
    end
    head :no_content
  end


  private

  def alert_params
    params.permit(:reference_id, :delay, :description)
  end

  def set_alert
      @alert = Alert.find_by_reference_id(params[:reference_id])
  end
end
