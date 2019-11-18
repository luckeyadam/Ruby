# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do |ep|
    ep = EndpointConfig.new
    ep.url = 'https://api.pagerduty.com/incidents'
    ep.password = Rails.application.credentials.pagerduty_key
    ep.password_confirmation = Rails.application.credentials.pagerduty_key
    ep.save!
end