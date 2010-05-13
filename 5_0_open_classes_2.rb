# Overriding a method in a core class. Generally a bad idea, especially if
# you do something this stupid!

class Fixnum
  def + other
    self - other
  end
end

puts 5 + 2
