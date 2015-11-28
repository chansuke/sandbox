require "./lillouis"

class UpDown
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [ status, headers, body.reverse ]
  end
end

class Red
  def initialize(app, pattern)
    @app = app
    @pattern = pattern
  end

  def call(env)
    status, headers, body = @app.call(env)

    replace = ->pat{ "<em style='background-color:red'>#{pat}</em>" }
    new_body = body.inject([]) { |m, part| m << part.gsub(@pattern) { replace[$&] } }

    [ status, headers, new_body ]
  end
end

use Red, /rack|lillouis/i

use UpDown

run method(:lillouis)
