class EndpointAlert < ApplicationRecord
  belongs_to :endpoint_config
  validates :identifier, presence: true

  # With websocket connection, pass to background job to reduce collisions and errors
  after_create_commit { EndpointAlertBroadcastJob.perform_later(self, 'add') }

  def create
    @endpoint_alert = endpoint_config.endpoint_alerts.build(endpoint_alert_params)
  end

  def endpoint_alert_params
     params.require(:endpoint_alert).permit(:identifier, :title, :description, :status)
  end
end
