HTTP_METHODS = %w(get put post delete)

HTTP_METHODS.each do |word|
  eval << END_OF_METHOD
    def #{word}(path, *args, &block)
      r[path].#{m}(*args, &block)
    end
  END_OF_METHOD
end
