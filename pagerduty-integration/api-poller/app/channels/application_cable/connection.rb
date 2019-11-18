module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :endpoint_config

    def connect
      self.endpoint_config = find_verified_endpoint_config
      logger.add_tags 'ActionCable', endpoint_config.id
    end

    protected

    def find_verified_endpoint_config
      if endpoint_config = EndpointConfig.includes(:endpoint_alerts).find(1)
        endpoint_config
      end
    end
  end
end
