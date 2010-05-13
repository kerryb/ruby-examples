# Mixing in functionality using a module

module Logging
  def log message
    puts "#{Time.now} | #{message}"
  end
end

class Foo
  include Logging

  def foo
    log 'In the foo method'
  end
end

Foo.new.foo
