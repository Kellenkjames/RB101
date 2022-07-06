#* Practice Problems: Easy 1

# Question 1: What would you expect the code below to print out? 
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # Prints original numbers arr => [1, 2, 2, 3]

# ----------------------------------------------------------------

# Question 2: Describe the difference between ! and ? in Ruby. And explain what would happe in the following scenarios 

#* ! | called Logical NOT operator. Used to reverse the logical state of its operand. If a condition is true, then Logical NOT operator will make it false. 

#* ? | defined? is a special operator that takes the form of a method call to determine whether or not the passed expression is defined. It returns a description string of the expression, nor nil if the expression isn't defined. 

=begin

* 1. what is != and where should you use it? 

A: This is the logical NOT operator. You should use it when you want test the "opposite" of the logical state. Most commonly used in conditional statements. 

# ----------------------------------------------------------------

*2. put ! before something, like !user_name

A: user_name = 'Bitcoin'           !user_name => false 

Returns false because it's the opposite of a "truthy" value. Any variable that has an assigned value is 'truthy' unless assigned with 'false' or 'nil' 

# ----------------------------------------------------------------

*3. put! after something, like words.uniq! 

A: words = [1, 2, 3, 4, 4, 5]        words.uniq! => [1, 2 ,3]

The uniq method returns a new array. Placing ! at the end is a destructive method that will remove any duplicate values in 'self'. This means the original array will be modified and returned. 




=end 