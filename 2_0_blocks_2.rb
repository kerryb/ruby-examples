# Passing a parameter to a block

block_2 = Proc.new do |n|
  puts 'Beginning of block'
  puts "Value of n is #{n}"
  puts 'End of block'
end

block_2.call(42)
