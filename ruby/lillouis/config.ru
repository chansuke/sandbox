# config.ru
require "./lillouis"

class A
  def initialize(arg)

  end

  def call(arg)
    return 200, {'Content-Type' => 'text/html'}, "Hello".chars
  end
end

use A

run method(:lillouis)
