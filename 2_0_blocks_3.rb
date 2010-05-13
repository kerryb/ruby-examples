# Passing a block to another block, which yields to the caller's block

def block_demo
  puts 'Beginning of method'
  yield
  puts 'End of method'
end

block_demo do
  puts 'Hello'
end
