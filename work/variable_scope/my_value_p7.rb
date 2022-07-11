a = 7
array = [1, 2, 3]

array.each do |element|
  a = element # We are "reassigning from the initialization of "a"  on line 1
end

puts a

# Answer: 3 (prints the last element)

# Explanation: The scoping rules for a method invocation with a block differ from the rules for method definitions. With method definitions, local variable scope is restricted to the method definition itself. 

# In contrast, a method invocation with a block has more open scoping rules; the block can use and modify local variables that are defined outside the block.

# Summary: In this case, "a" starts out as 7, then we set "a" to 1, 2, and 3 in sequence. By the time we get to the puts, "a" has a value of 3. 