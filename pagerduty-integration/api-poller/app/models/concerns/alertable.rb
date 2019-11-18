module Alertable
    extend ActiveSupport::Concern

    def alert_exist(alert_identifier)
        EndpointAlert.where(:identifier => alert_identifier).nil?
    end

end