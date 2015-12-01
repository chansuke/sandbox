module M1
  def self.included(othermod)
    puts "M1 is included into #{othermod}"
  end
end

module M2
  def self.prepended(othermod)
    puts "M2 is prepended to #{othermod}"
  end
end

class C
  include M1
  include M2
end
