# In Ruby, booleans are represented by the true and false objects. Like everything else in Ruby, boolean objects also have real classes behind them, and you can call methods on true and false.

true.class              # => TrueClass
true.nil?                 # => false
true.to_s                # => "true"
true.methods        # => list of methods you can call on the true object

false.class             # => FalseClass
false.nil?                # => false
false.to_s               # => "false"
false.methods       # => list of methods you can call on the false object

#                                                                                                 

# Example 1 - The below will always output "hi"
if true
  puts "hi"
else
  puts 'goodbye'
end 

# Example 2 - Conversely, the below will always output 'goodbye' 
if false
  puts 'hi'
else 
  puts 'goodbye'
end 

#                                                                                                 

# Expressions and Conditionals 

# In real code, you won't use the "true" or "false" objects directly in a conditional. Instead, you'll likely be evaluating some expression or method call in a conditional. Whatever the expression, it should evaluate to a "true" or "false" object.


# Example 3
num = 5

if (num < 10)
  puts "small number"
else 
  puts "large number"
end 

# The above outputs "small number" because the expression num < 10 evaluates as true. 

# Example 4
puts "it's true!" if some_method_call # error, we have not defined this variable or method

# The above will output "it's true!" if "some_method_call" returns a truthy value. 

# When using method calls as a conditional expression in this way, you'll generally want the method to return a boolean rather than relying on the truthiness or falsyness of a non-boolean return value. 

#                                                                                                 





