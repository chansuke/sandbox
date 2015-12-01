class A
  def a; puts "aaa" end
  def b; puts "bbb" end
  def c; puts "ccc" end

  def self.compare(old_method, new_method)
    define_method(old_method) do |*args, &block|
      puts "#{old_method} is deprecated. #{new_method} is new"
      send(new_method, *args, &block)
    end
  end

  compare :old_a, :a
  compare :old_b, :b
  compare :old_c, :c
end
