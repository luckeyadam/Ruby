class EndpointConfigsChannel < ApplicationCable::Channel

    def subscribed
        stream_from "endpoint_config_#{params['endpoint_config_id']}_channel"
    end

    def unsubscribed
    end
    
    def send_endpoint_alert(data)
        # endpoint_config comes from connection.rb in channels
        endpoint_config.endpoint_alerts.create!(identifier: data['identifier'], endpoint_config_id: data['endpoint_config_id'])
    end
end