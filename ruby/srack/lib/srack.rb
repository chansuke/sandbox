$:.unshift File.expand_path(File.join(*%w(.. lib)), File.dirname(__FILE__))

module Srack
  autoload :Builder, "srack/builder"
  autoload :Handler, "srack/handler"
  autoload :Server, "srack/server"
end
