#* Practice Problems: Easy 1

# Question 1: What would you expect the code below to print out? 
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # Prints original numbers arr => [1, 2, 2, 3]

# ----------------------------------------------------------------

# Question 2: Describe the difference between ! and ? in Ruby. And explain what would happe in the following scenarios: 

#* Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. 

=begin

* 1. what is != and where should you use it? 

A: != means "not equals"

This is the logical NOT operator. You should use it when you want test for equality. 

# ----------------------------------------------------------------

*2. put ! before something, like !user_name

A: user_name = 'Bitcoin'           !user_name => false 

This will return the opposite boolean i.e. if string object is truthy, then it returns false (the opposite)

# ----------------------------------------------------------------

*3. put ! after something, like words.uniq! 

A: words = [1, 2, 3, 4, 4, 5]        words.uniq! => [1, 2 ,3]

Placing ! at the end is a destructive method that will modify the original object (pass by reference) => it will not create a copy.

# ----------------------------------------------------------------

*4. put ? before something 

? : Ternary if-then-else

If condition is true ? Then value 'X': Otherwise value 'Y' 

# ----------------------------------------------------------------

*5. put ?

defined? variable # True if variable is initialized

This will return a boolean "true" or "false" if the object or method has been defined 

# ----------------------------------------------------------------

*6. put !! before something, like !!user_name

Is used to turn any object into their boolean equivalent 

=end 