class MethodPrinter
  def method_missing name, *args
    puts "You called #{name}(#{args.join ', '})"
  end
end

method_printer = MethodPrinter.new
method_printer.foo
method_printer.bar 1, 2

exit

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
