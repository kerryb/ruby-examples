# Overriding a method after aliasing the original version, so we can call
# it from the new one. Differs from a subclass override in that we can do
# it on a single class (or even object) at runtime.

puts 'before'.inspect

class String
  alias_method :original_inspect, :inspect
  def inspect
    "The string is #{original_inspect}."
  end
end

puts 'after'.inspect

# Put everything back so we can run the example more than once
# in the same ruby instance
class String
  alias_method :inspect, :original_inspect
end
