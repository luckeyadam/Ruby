class ApiChannel < ApplicationCable::Channel
  def subscribed
    stream_from "api_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def poll_result(data)
    #cacheCurrent = Rails.cache.read("https://api.pagerduty.com/incidents")
    # ApiWorker.perform_async({"api_url": "https://api.pagerduty.com/incidents", "token": "GxbsvX4kbYja_nX7ZTqt"})
    # we do diff off the id
    
    # cacheNew = Rails.cache.read("https://api.pagerduty.com/incidents")
    
    # cacheNewIDs = []

    # cacheNew.each do |alert|
    #   cacheNewIDs.push(alert.alert_id)
    # end

    # cacheCurrent.each do |alert|
    #   #puts alert
    #   if !cacheNewIDs.include?(alert.alert_id)
    #     return cacheNew
    #   end
    # end

    # ActionCable.server.broadcast 'api_channel', message: 'No change'
  end
end
