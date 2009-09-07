class SingletonOne
  @@instance = new

  def self.instance
    @@instance
  end

  private_class_method :new
end

puts SingletonOne.instance.object_id
puts SingletonOne.instance.object_id

SingletonOne.new

exit

require 'singleton'

class SingletonTwo
  include Singleton
end

puts SingletonTwo.instance.object_id
puts SingletonTwo.instance.object_id

SingletonTwo.new
