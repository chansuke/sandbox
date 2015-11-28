#!/usr/bin/env ruby

exit if 'who -q'.include? ENV['USER']

require 'dotenv'
require 'twilio-ruby'

Dotenv.load

TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
TWILIO_AUTH_TOKEN  = ENV['TWILIO_AUTH_TOKEN']

@twilio = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN


