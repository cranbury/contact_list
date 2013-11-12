require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'contacts/2',
  ).to_s

# puts RestClient.post(url, {'contact[name]' => 'Gred',
#    'contact[email]' => 'Greg@appacademy.io', 'contact[user_id]' => 1})

puts RestClient.delete(url)

# puts RestClient.get(url)