require 'contextio'
require 'json'

key     = 'the key you get in your developer console'
secret  = ' the secret you get in your developer console'
account = 'your account name... probably just your email'

connection = ContextIO::Connection.new(key, secret)
messages = connection.all_messages(:account => account, :since => (Time.now - 24 * 60 * 60 * 5))
puts JSON.parse(messages)['data'].first['subject']
