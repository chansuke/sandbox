def method
  x = "Hello"
  yield("aaa")
end

x = "Bye"
p method { |y| "#{x}, #{y} world" }
