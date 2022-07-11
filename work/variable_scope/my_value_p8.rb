array = [1, 2, 3]

# a = nil (needs to be initialized outside of the block scope)

array.each do |element|
  a = element
end

puts a

# Answer: Undefined local variable or method "a"

# Explanation: Compared to the previous exercise, the difference here is that we removed the initialization of the local variable "a" in the outer-most scope before invoking the "each" method and passing in a block. 