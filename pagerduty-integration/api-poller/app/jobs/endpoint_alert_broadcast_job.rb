class EndpointAlertBroadcastJob < ApplicationJob
    queue_as :default

    def perform(endpoint_alert, method)
        puts "Beginning broadcasting to endpoint_config_#{endpoint_alert.endpoint_config.id}_channel, method: #{method}" 
        ActionCable.server.broadcast "endpoint_config_#{endpoint_alert.endpoint_config.id}_channel", endpoint_alert: render_endpoint_alert(endpoint_alert), method: method
    end

    private

    def render_endpoint_alert(endpoint_alert)
        puts "Rendering alert in EndpointAlertBroadcastJob"
        EndpointAlertsController.render partial: 'endpoint_alerts/endpoint_alert', locals: { endpoint_alert: endpoint_alert }
    end
end