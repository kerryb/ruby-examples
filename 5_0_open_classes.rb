class Fixnum
  def + other
    self - other
  end
end

puts 5 + 2

exit

class Fixnum
  def cubed
    self ** 3
  end
end

puts 5.cubed
