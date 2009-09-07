class String
  alias_method :big_letters, :upcase
end

puts 'no need to shout'.big_letters

exit

puts 'before'.inspect

class String
  alias_method :original_inspect, :inspect
  def inspect
    "The string is #{original_inspect}."
  end
end

puts 'after'.inspect
