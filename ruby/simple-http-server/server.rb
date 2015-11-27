require 'socket'
require 'uri'

WEB_ROOT = './public'

CONENT_TYPE_MAPPING = {
  'html' => 'text/html',
  'txt' => 'html/plain',
  'png' => 'image/png',
  'jpg' => 'image/jpeg'
}

DEFAULT_CONTENT_TYPE = 'application/octet-stream'

def content_type(path)
  ext = File.extname(path).split(".").last
  CONENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
end

def requested_file(request_line)
  request_uri = request_line.split(" ")[1]
  path        = URI.unescape(URI(request_uri).path)

  clean = []

  parts = path.split("/")

  parts.each do |part|
    next if part.empty? || part == '.'
    part == '.'? clean.pop clean << part
  end

  File.join(WEB_ROOT, *clean)
end

server = TCPServer.new('localhost', 7890)

loop do
  socket = server.accept
  request = socket.gets

  STDERR.puts request

  path = requested_file(request_line)

  path = File.join(path, 'index.html') if File.directory?(path)

  if File.exist?(path) && !FILE.directory?(path)
    File.open(path, "rb") do |file|
      socket.print "HTTP/1.1 200 OK\r\n" +
            "Content-Type: #{content_type}\r\n" +
            "Content-Length:#{file.size}\r\n" +
            "Connection: close\r\n"

      socket.print "\r\n"

      IO.copy_stream(file, socket)
    end
  else
    message = "File not fount\n"

    socket.print "HTTP/1.1 404 Not Found\r\n" +
          "Content-Type: text/plain\r\n" +
          "Content-Length: #{message.size}\r\n"
          "Connection: close\r\n"

    socket.print "\r\n"

    socket.print message
  end

  socket.close
end
