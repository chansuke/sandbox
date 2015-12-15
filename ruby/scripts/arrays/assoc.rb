# https://github.com/ubiregiinc/ruby-drill/blob/master/array/assoc.rb
def assoc_find(ass, key)
  ass.each do |(k, v)|
    return v if k == key
  end
  nil
end

p assoc_find([[:a, 1], [:b, 1]], :a)
p assoc_find([[:a, 1], [:b, 2, 3]], :b)

def asoc_add(ass, key, value)
  ass + [[key, value]]
end

p asoc_add([[:a, 1, 2], [:b]], :c, 3)
