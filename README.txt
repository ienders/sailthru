= sailthru

== DESCRIPTION:

Sailthru Triggermail Client, with some added bonus features and simpler integration with your Rails stack, including YML config for keys and mailing list name.

== INSTALLATION:

 $ gem install sailthru

== USAGE:

= Include in your app.

  require 'sailthru/client'

= Set your configuration in RAILS_ROOT/config/sailthru.yml.

  api_key: YOUR_API_KEY
  secret: YOUR_SECRET
  api_uri: http://api.sailthru.com
  mailing_list_key: mailing_list

= Make calls to Sailthru as you would with the normal triggermail client:

  client = Sailthru::Client.new
  client.send(...)