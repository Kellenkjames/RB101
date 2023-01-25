# Question 2

# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

#! Error: No implicit conversion of Integer into String (TypeError)

# one solution: string interpolation
puts "the value of 40 + 2 is #{40 + 2}"

# second solution: to_s method
puts "the value of 40 + 2 is " + (40 + 2).to_s

