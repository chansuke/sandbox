module Lillouis
  @routes = { get:{} }

  def lillouis(env)
    path = env['PATH_INFO']
    if res = @@routes[:get][path]
      res.call(env)
    else
      res.call(env)
    end
  end

  def get(path, &blk)
    @@routes[:get][path] = blk
  end

  def headers
    { 'Content-Type' => 'text/html' }
  end
end

Object.send(:include, Lillouis)

get '/' do
  [ 200, headers, top_body(env) ]
end

get '/lillouis' do
  [ 200, headers, lillouis_body ]
end

def top_body(env)
  ["<h1>Welcome to the lillouisi</h1>"] +
  env.map { |k,v| "<p>%s => %s</p>" % [k, v] }
end

def lillouis_body
  ["<img src='http://leadinvestor.com.au/wp-content/uploads/2014/08/Mark-Zuckerberg-says1.jpg'>"]
end

def not_found
  ["<img src='http://jaysword.typepad.com/.a/6a0133ee28efb1970b015431f140a3970c-800wi'>"]
end

run method(:lillouis)
