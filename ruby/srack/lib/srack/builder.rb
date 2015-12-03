class Srack::Builder
  def self.parse_file(config)
    cfgfile = File.read(config)
    app = eval "Srack::Builder.new {\n" + cfgfile + "\n}.to_app", TOPLEVEL_BINDING, config
    return app
  end

  def initialize(&block)
    @use = []
    instance_eval(&block)
  end

  def use(middleware, *args, &block)
    @use << proc { |app| middleware.new(app, *args, &block) }
  end

  def run(app)
    @run = app
  end

  def to_app
    app = @run
    @use.reverse.inject(app) { |a, e| e[a] }
  end
end
