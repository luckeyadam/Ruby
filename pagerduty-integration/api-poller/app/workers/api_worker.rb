class ApiWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(args)
        puts "api_worker doing nothing"
        # puts "Performing API request"
        # ep = Endpoint.new()
        # ep.get_payload(args['api_url'], args['token'])
    end
end