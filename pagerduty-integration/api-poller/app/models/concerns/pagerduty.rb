module Pagerduty
    extend ActiveSupport::Concern

    def convert_incidents_to_alerts(json_payload, endpoint_config)
        alerts = []
        json_payload.each do |incident|
            #find assignee
            assignee = 'unassigned'
            if incident['assignments'].empty? == false
                # incident['assignments'].each do |assignee|
                #     if alert.assigned_to == nil
                #         assignee = assignee['assignee']['summary']
                #     else
                #         user = alert.assigned_to
                #         user.concat(" "+assignee['assignee']['summary'])
                #         assignee = user
                #     end
                # end
            end
            
            alert = endpoint_config.endpoint_alerts.create!(
                identifier: incident['id'],
                title: incident['title'],
                status: incident['status'],
                endpoint_config: endpoint_config
                )
            alerts.push(alert)
        end
            Rails.cache.fetch("endpoint_config_#{endpoint_config.id}", force: true) do
                alerts
            end
        alerts
    end

    def incidents_exist(json_payload, check_type)
        alerts = []
        if !json_payload['incidents'].nil?
            json_payload['incidents'].each do |incident|
                if EndpointAlert.where(:identifier => incident['id']).exists? == check_type #false
                    puts "#{incident['id']} exist in DB == #{check_type}"
                    alerts.push(incident)
                end
            end
        end
        alerts
    end

    def delete_incident(endpoint_config)
    end
end