App.api = App.cable.subscriptions.create "ApiChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # console.log data['message']
    # # call to update /ul
    # if data['message'] isnt 'No change'
    #   $("#incidents").html data['message']

  poll_result: (payload) ->
    #console.log payload
    @perform 'poll_result', message: payload

# setInterval =>
#   console.log 'interval'
#   App.api.poll_result('data')
# , 5000
