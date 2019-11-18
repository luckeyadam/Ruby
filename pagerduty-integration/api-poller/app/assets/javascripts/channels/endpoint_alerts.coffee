jQuery(document).on 'turbolinks:load', ->
    endpoint_alerts_div = $('#endpoint_alerts')
    if endpoint_alerts_div.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "EndpointConfigsChannel"
            # endpoint-config-id comes from div on show page
            endpoint_config_id: endpoint_alerts_div.data('endpoint-config-id')
        },
        connected: ->
        disconnected: ->
        received: (data) ->
            if data['method'] == 'add'
                endpoint_alerts_div.append data['endpoint_alert']
            else if data['method'] == 'remove'
                document.getElementById(data['endpoint_alert'].id).remove()
        send_endpoint_alert: (identifier, endpoint_config_id) ->
            @perform 'send_endpoint_alert', identifier: identifier, endpoint_config_id: endpoint_config_id
    $('#new_endpoint_alert').submit (e) ->
        # get instance of event
        $this = $(this)
        # find alert information
        identifier_textarea = $this.find('#endpoint_alert_identifier')
        if $.trim(identifier_textarea.val()).length > 0
            App.global_chat.send_endpoint_alert identifier_textarea.val(),
            endpoint_alerts_div.data('endpoint-config-id')
            identifier_textarea.val('')
        # prevent reload and going to new page
        e.preventDefault()
        return false