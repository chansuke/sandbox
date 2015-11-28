#!/usr/bin/env ruby

exit if 'who -q'.include? ENV['USER']

require 'dotenv'
require 'twilio-ruby'

Dotenv.load

TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
TWILIO_AUTH_TOKEN  = ENV['TWILIO_AUTH_TOKEN']

@twilio = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

my_number   = 'xxx'
boss_number = 'yyy'

excuse = [
  '体調が芳しくないので',
  '頭痛が酷いので',
  '家の用事があるので'
].sample

# Send a text message
@twilio.messages.create(
  from: my_number, to: number_of_boss,
  body: "#{excuse},自宅稼働します。"
)

# Log this
puts "送信時刻: #{Time.now} | Excuse: #{excuse}"
