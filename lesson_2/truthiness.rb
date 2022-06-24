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
puts "it's true!" if some_method_call 

# The above will output "it's true!" if "some_method_call" returns a truthy value. 

# When using method calls as a conditional expression in this way, you'll generally want the method to return a boolean rather than relying on the truthiness or falsyness of a non-boolean return value. 

#                                                                                                 

# Logical Operators

# Logical operators will return either a truthy or falsey value when evaluating two expressions. 

# &&: this operator is the "and" operator and, in the following examples, will return "true" only if both expressions being evaluated are true. 

# Example 5
true && true                      # => true
true && false                     # => false 
num = 5                             # => 5
num < 10 && num.odd?   # => true 
num > 10 && num.odd?   # => false   

# Take notice that we didn't have to put num > 10 in parentheses. This means that Ruby's order of operator precedence considers > as higher precedence than &&. 

# In other words, Ruby didn't get confused; it didn't think you were trying to do this: num > (10 && num.odd?).

# Example 6 - You can chain as many expressions as you'd like with &&, and it will be evaluated left to right. If any expression is false, the entire && chain will return false. 
num = 5                                                                  # => 5
num < 10 && num.odd? && num > 0                   # => true 
num < 10 && num.odd? && num > 0 && false    # => false

# ||: this operator is the "or" operator and, in the following examples, will return "true" if either one of the evaluated objects is true. It's less strict than the && operator. 

# Example 7 - only way to return "false" is if all expressions are "false"
true || true                  # => true 
false || false               # => false 
true || false                # => true 
false || true                # => true 

# Short Circuiting: the && and || operators exhibit a behavior called short circuiting, which means it will stop evaluating expressions once it can guarantee the "return" value. 

# Example 8 - the && will short circuit when it encounters the first "false" expression. 
false && 3/0        # => false 

# Notice the above code doesn't generate a "ZeroDivisionError". This is because the && operator didn't even evaluate the second expression; since the first expression is "false", it can short circut and return "false".

# This would generate an error (it will evaluate "both" expressions since it did not encounter true)
false || 3/ 0

# Example 9 - the || will short circuit when it encounters the first "true" expression
true || 3/0

# The above code doesn't generate a "ZeroDivisionError" because || didn't evaluate the second expression; it short circuited after encountering "true".

# Similar to before, notice that true && 3/0 will generate an error
true && 3/0

# Relying on the short circut behvaior can be dangerous, but it's sometimes handy. We'll see some examples of its use in common Ruby code below. 

#                                                                                                 