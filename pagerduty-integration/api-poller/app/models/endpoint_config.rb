class EndpointConfig < ApplicationRecord
    has_secure_password
    has_many :endpoint_alerts, dependent: :destroy
    include Alertable
    include Pagerduty
    require "net/http"
    require "json"

    def get_payload(url, token)
        puts 'Getting Payload'
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)

        request['authorization'] = "Token token=#{token}"

        response = http.request(request)
        self.payload = response.body
    end

    # private
    # def add_alerts_to_cache(alerts)
    #     puts "Inserting into cache: #{self.url}"
    #     puts alerts
    #     Rails.cache.fetch(self.url, force: true, expires_in: 1.minutes) do
    #         alerts
    #     end
    # end
end
