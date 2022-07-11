a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# Answer: 7

# Explanation: This problem demonstrates "shadowing". Shadowing occurs when a block argument hides a local variable that is defined outside the block (because they have the same "name"). 

# Since the outer "a" is shadowed, the a+= 1 has no effect. 

# Note: each method does not use the "return" value of it's block - it simply returns the original array that it was called on. 

