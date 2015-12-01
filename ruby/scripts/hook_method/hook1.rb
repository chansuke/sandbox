class String
  def self.inherited(subclass)
    puts "#{self} is inherited to #{subclass}"
  end
end

class MyString < String; end
