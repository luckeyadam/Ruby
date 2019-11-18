class PagesController < ApplicationController
  def show
    # TODO change this from 1 to something meaningful
    @endpoint_config = EndpointConfig.includes(:endpoint_alerts).find(1)
    @endpoint_alert = EndpointAlert.new
  end
end
