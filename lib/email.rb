# Generate email when a user defined threshold is met upon querying the API

require 'mail'

mail = Mail.new do
  # from 'john.demos.co@gmail.com'
  # to 'jdemos@twitter.com'
  subject 'Hello!'
  body 'This is an email that was sent using Ruby.'
end

# logic for handling threshold and triggering an email
if tweets_received >= threshold
  mail.delivery_method :sendmail
  mail.deliver
end

