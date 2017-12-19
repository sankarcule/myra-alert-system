class AlertsController < ApplicationController
  def index
    @alerts = Alert.all
    json_response(@alerts)
  end
end
