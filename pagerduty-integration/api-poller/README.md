# About the API Poller

The API poller runs against the pager duty API every 1 minute. It polls the api for incidents and adds them to the home page list when new incidents in pagerduty appear. You can also create your own incidents.

This application uses the sidekiq background job scheduler to asycronysly poll the API every minute, while the actioncable channel is used to live update the frontpage with websockets.

# How to run:
The rails secrets are encrypted with rails:credentials so you would need the master.key to decode the secrets in code, otherwise you will need to generate your own rails credentials and master key and replace the encrypted secrets file. The required key needs to be called pagerduty_key.

If you have the master key or have generated your own, you can edit the credentials with:
```
EDITOR="vim" credentials:edit
```
  - Enter a value as such:
    ```
    pagerduty_key: xxxxxxxxxxx
    ```

On one terminal run the following to watch sidekiq:
```
sidkiq -c 1
```

On another terminal run the following to see the webserver:
```
rails db:setup
rails c
```

Then visit localhost:3000 and you should see the page.