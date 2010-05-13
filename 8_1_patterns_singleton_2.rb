# Ruby provides a Singleton module that does it for us

require 'singleton'

class SingletonTwo
  include Singleton
end

puts SingletonTwo.instance.object_id
puts SingletonTwo.instance.object_id

SingletonTwo.new
