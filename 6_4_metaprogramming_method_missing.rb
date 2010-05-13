# Intercepting calls to non-existent methods

class MethodPrinter
  def method_missing name, *args
    puts "You called #{name}(#{args.join ', '})"
  end
end

method_printer = MethodPrinter.new
method_printer.foo
method_printer.bar 1, 2
