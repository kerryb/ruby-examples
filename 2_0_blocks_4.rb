# Parameterised yield

def block_demo_2
  puts 'Beginning of method'
  yield 'block_demo_2'
  puts 'End of method'
end

block_demo_2 do |name|
  puts "Hello from #{name}"
end
