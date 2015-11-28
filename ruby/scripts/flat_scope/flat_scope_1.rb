my_var = 'aaa'

# skip first scopegate by using Class.new
Myclass =  Class.new do
  puts "クラス定義のなかは #{my_var}"
# use define_method to skip method
  define_method :my_method do
    "Here is #{my_var}"
  end
end

puts Myclass.new.my_method
