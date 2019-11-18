class Endpoint < ApplicationRecord
    has_secure_password
    has_many :categorizations # can remove
    has_many :alerts, through: :categorizations # can remove
    has_many :endpoint_alerts, dependent: :destroy
    require "net/http"
    require "json"

    def get_payload(url, token)
        self.url = url
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)

        request['authorization'] = "Token token=#{token}"

        response = http.request(request)
        self.payload = response.body
        add_alerts_to_cache(convert_to_alerts())
    end

    private
    def add_alerts_to_cache(alerts)
        puts "Inserting into cache: #{self.url}"
        puts alerts
        Rails.cache.fetch(self.url, force: true, expires_in: 1.minutes) do
            alerts
        end
    end

    def convert_to_alerts
        alert_json = JSON.parse(self.payload)
        alerts = []
        alert_json['incidents'].each do |incident|
            puts "Creating alert: #{incident['id']}"
            alert = Alert.new()
            alert.alert_id = incident['id']
            alert.title = incident['title']
            alert.status = incident['status']
            if incident['assignments'].empty? == false
                incident['assignments'].each do |assignee|
                    if alert.assigned_to == nil
                        alert.assigned_to = assignee['assignee']['summary']
                    else
                        user = alert.assigned_to
                        user.concat(" "+assignee['assignee']['summary'])
                        alert.assigned_to = user
                    end
                end
            else
                alert.assigned_to = 'unassigned'
            end
            alerts.push(alert)
        end
        alerts
    end
end
