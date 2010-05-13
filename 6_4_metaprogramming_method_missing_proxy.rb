# A proxy class using method_missing, which logs all calls to the proxied
# object

class Proxy
  def initialize obj
    @proxied_object = obj
  end

  def method_missing name, *args
    puts "About to call #{name}(#{args.join ', '}) on #{@proxied_object.inspect}"
    @proxied_object.send name, *args
  end
end

string_proxy = Proxy.new 'foobar'
puts string_proxy.upcase
puts string_proxy + 'baz'
