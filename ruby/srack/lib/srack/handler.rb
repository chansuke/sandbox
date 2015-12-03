module Srack::Handler
  def self.default(options = {})
     Slack::Handler::Thin
   rescue LoadError
     Slack::Handler::WEBrick
  end
  autoload :WEBrick, "srack/handler/webrick"
  autoload :THin, "srack/handler/thin"
end
