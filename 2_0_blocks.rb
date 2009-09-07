block = Proc.new do
  puts 'This is a block'
end

block.call

exit

block_2 = Proc.new do |n|
  puts 'Beginning of block'
  puts "Value of n is #{n}"
  puts 'End of block'
end

block_2.call(42)

exit

def block_demo
  puts 'Beginning of method'
  yield
  puts 'End of method'
end

block_demo do
  puts 'Hello'
end

exit

def block_demo_2
  puts 'Beginning of method'
  yield 'block_demo_2'
  puts 'End of method'
end

block_demo_2 do |name|
  puts "Hello from #{name}"
end
