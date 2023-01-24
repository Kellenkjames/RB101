# Question 1

# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

=begin

Explanation: In this example, `numbers.uniq` returns a new array. The method will return a new array with the unique elements from self, i.e, only elements that appear once.

In this case, we invoke puts on the original `numbers` array, not the mutated version; therefore, we will end up printing the original object before it was mutated.

In addition, the `puts` method will print each element on a newline if passed in an array. 

=end