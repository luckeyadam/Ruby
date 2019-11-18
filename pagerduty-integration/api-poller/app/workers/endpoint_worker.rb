class EndpointWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(args)
        begin
        puts "Performing API request"
        # get the first endpoint config and the alerts related to it (Pagerduty is id 1)
        ep = EndpointConfig.includes(:endpoint_alerts).find(1)
        # Get alert data from endpoint
        alert_json = JSON.parse(ep.get_payload(args['api_url'], args['token']))
        # Find incidents that havent been stored in the database
        unstored_incidents = ep.incidents_exist(alert_json, false)
        # # Find incidents that are stored in the database....not currently being used
        # existing_incidents = ep.incidents_exist(alert_json, true)
        # Convert unstored incidents to the alert model and store them
        ep.convert_incidents_to_alerts(unstored_incidents, ep)
        rescue StandardError => e
            print e
        end
    end
end