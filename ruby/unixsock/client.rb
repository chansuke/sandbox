require 'socket'
require 'logger'

log = Logger.new(STDOUT)

UNIXSocket.open('server.sock') do |sock|
  while true
    log.info sock.readline.chomp!
  end
end
