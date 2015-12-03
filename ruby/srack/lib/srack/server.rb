class Srack::Server
  def self.start
    new.start
  end

  def start
    server.run wrapped_app, options
  end

  def options
    @options ||= parse_options(ARGV)
  end

  def parse_options(args)
    default_options
  end

  def default_options
    {
      :environment => ENV['RACK_ENV'] || "development",
      :pid         => nil,
      :Port        => 9292,
      :Host        => "0.0.0.0",
      :AccessLog   => [],
      :config      => "config.ru"
    }
  end

  def wrapped_app
    @wrapped_app ||= build_app app
  end

  def app
    @app = Lack::Builder.parse_file(self.options[:config])
  end

  def build_app(app)
    middleware[options[:environment]].reverse.inject(app) { |a, mid| mid.new(a) }
  end

  def middleware
    self.class.middleware
  end

  def self.middleware
    @middleware ||= begin
      m = Hash.new {|h,k| h[k] = []}
    end
  end

  def server
    @_server ||= Lack::Handler.default(options)
  end
end
