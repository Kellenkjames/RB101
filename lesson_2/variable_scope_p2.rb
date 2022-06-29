# More Variable Scope 

#* Learning Goals:

# 1. Build on the definitions outlined in the previous assignment

# 2. Provide a slightly more complex but more accurate mental model of methods, blocks, how they inter-relate, and how local variable scope fits into the picture

# Method definition is when, within our code, we define a Ruby method using the "def" keyword
def greeting
  puts "Hello"
end 

# Method invocation is when we call a method, whether that happens to be an existing method from the Ruby Core API or core Library, or a custom method that we've defined ourselves using the "def" keyword
greeting # Calling the greeting method outputs "Hello"

[1, 2, 3].each { |num| puts num } # example of a method being called inside a block 

#* A block is part of the method invocation. In fact, method invocation followed by curly braces or do..end is the way in which we define a block in Ruby. 

# The block acts as an "argument" to the method. In the same way that a local variable can be passed as an argument to a method at invocation, when a method is called with a block, the block acts as an argument to that method. 

#* Example 1: a method parameter not used
def greetings(str)
  puts "Goodbye"
end 

word = "Hello"

greetings(word)        # Outputs 'Goodbye' => doesn't do anything with the string "Hello"

#* Example 2: a method parameter used 
def greetings(str)
  puts str
  puts "Goodbye"
end 

word = "Hello"

greetings(word)

# Outputs 'Hello' 
# Outputs 'Goodbye'

#* Example 3: block is not executed 
def greetings
  puts "Goodbye"
end 

word = "Hello"

greetings do 
  puts word # the method is not defined to use a block 
end 

# Outputs 'Goodbye'

#* Example 4: block executed 
def greetings
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do 
  puts word
end 

# Outputs 'Hello'
# Outputs 'Goodbye'

#* Important take-away for now is that blocks and methods can interact with each other; the level of that interaction is set by the method definition and then used at method invocation. 

a = "hello"

[1, 2, 3].map { |num| a  } # => ["hello", "hello", "hello"]

#* Methods can access local variables passed in as arguments, and now we have seen that methods can access local variables through interaction with blocks. 

#* Summary: 

# 1. The def..end construction in Ruby is method definition 

# 2. Referencing a method name, either of an existing method or subsequent to definition, is method invocation 

# 3. Method invocation followed by {..} or do..end defines a block; the block is part of the method invocation

# 4. Method invocation sets a scope for local variables in terms of parameters and interaction with blocks 

# 5. Method invocation uses the scope set by the method definition 