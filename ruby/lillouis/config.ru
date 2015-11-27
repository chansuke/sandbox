@routes = { get:{} }

def lillouis(env)
  path = env['PATH_INFO']
  case path
  when '/lillouis' then [ 200, headers, lillouis_body ]
  when '/'         then [ 200, headers, top_body(env) ]
  else [ 404, headers, not_found ]
  end
end

def headers
  { 'Content-Type' => 'text/html' }
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
