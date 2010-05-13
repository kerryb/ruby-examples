# Demonstrates defining a simple block and calling it later

block = Proc.new do
  puts 'This is a block'
end

block.call
