require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts',
  # query_values: {
  #   'animals[dog]' => 'lassie',
  #   'animals[cat]' => 'garfield',
  #   'animals[fish][starfish]' => 'patrick',
  #   'hey' => 'ya'
  # }
).to_s

puts RestClient.get(url)