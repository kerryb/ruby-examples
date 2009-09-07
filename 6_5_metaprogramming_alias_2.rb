puts 'before'.inspect

class String
  alias_method :original_inspect, :inspect
  def inspect
    "The string is #{original_inspect}."
  end
end

puts 'after'.inspect
