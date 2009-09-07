require 'singleton'

class SingletonTwo
  include Singleton
end

puts SingletonTwo.instance.object_id
puts SingletonTwo.instance.object_id

SingletonTwo.new
