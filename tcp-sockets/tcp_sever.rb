#!/usr/bin/ruby

require "socket"

s0 = TCPServer.open(20000)

sock = s0.accept

while buf = sock.gets
  p buf
end

sock.close

s0.close
