# Variable Scope

# Example 1: outer scope variables can be accessed by inner scope 
a = 1            # outer scope variable

loop do       # the block following the invocation of the `loop' method creates an inner scope
  puts a       # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break        # necessary to prevent infinite loop
end

puts a         # => 2  "a" was re-assigned in the inner scope

# When we instantiate variables in an inner scope, we have to be very careful that we're not accidentally re-assigning an existing variable in an outer scope. 

# Example 2: inner scope variables cannot be accessed in outer scope
loop do       # the block following the invocation of the 'loop' method creates an inner scope
  b = 1
  break 
end 

puts b         # => NameError: undefined local variable or method 'b' for main:Object

# Example 3: peer scopes do not conflict 
2.times do 
  a = 'hi'
  puts a          # 'hi' <= this will be printed out twice due to the loop 
end 

loop do 
  puts a          # => NameError: undefined local variable or method 'a' for main:Object
  break 
end 

puts a          # => NameError: undefined local variable or method 'a' for main:Object

#* Peer blocks cannot reference variables initalized in other blocks. This means that we could use the same variable name a in the block of code that follows the "loop" method invocation. However, it's not the same variable as in the first block. 

# Example 4: nested blocks 
a = 1          # first level variable 

loop do     # second level 
  b = 2 

  loop do   # third level 
    c = 3
    puts a   # => 1
    puts b   # => 2
    puts c   # => 3
    break 
  end 

  puts a     # => 1
  puts b    # => 2
  puts c    # => NameError
  break
end 

puts a        # => 1
puts b       # => NameError
puts c       # => NameError

# Example 5: variable shadowing 
n = 10

[1, 2, 3].each do |n|
  puts n     # => [1, 2, 3] | This will disregard the outer scoped local variable. 
end 

n = 10 

1.times do |n|
  n = 11      # this also prevents us from making changes to the outer scoped n:
end 

puts n       # => 10 

# You want to avoid shadowing, as it's almost never what you intended to do. Choosing long and descriptive variable names is one simple way to ensure that you don't run into any of these weird scoping issues. 

#* Variables and Method Definitions 

# While a block can access variables that were initialized outside of the block, a method cannot -- its scope is self-contained. Methods can only access variables that were initialized inside the method or that are defined as parameters. 

# Example 1: a method definition can't access local variables in another scope 

a = 'hi'

def some_method 
  puts a 
end 

# invoke the method
some_method         # => NameError: undefined local variable or method 'a' for main:Object

# Example 2: a method definition can access objects passed in
def some_method(a)
  puts a          # this becomes a local variable
end 

some_method(5)      # => 5

hello = 'hi'

def hello
  "Saying hello!"
end 

puts hello
# puts hello()        # => this indicates that we want to call the method, not the local variable. 

# Ruby will first search for the local variable, and if it is not found, then Ruby tries to find a method with the given name. If neither local variable nor method is found, then a NameError message will be thrown. 

# Remember: Local variables that are not initialzied inside a method definition must 

#* Blocks within Method Definitions 
def some_method
  a = 1
  5.times do 
    puts a 
    b = 2
  end 

  puts a 
  puts b
end 

some_method       # => NameError: undefined local variable or method 'b' for main:Object 

#* Constants
# The scoping rules for constants are not the same as local variables. In procedural style programming, constants behave like globals. 
USERNAME = 'Batman'

def authenticate
  puts "Logging in #{USERNAME}"
end  

authenticate       # => Logging in Batman 

FAVORITE_COLOR = 'taupe'

1.times do 
  puts "I love #{FAVORITE_COLOR}!"      # => I love taupe!
end 

loop do 
  MY_TEAM = "Phoenix Suns"
  break 
end 

puts MY_TEAM          # => Pheonix Suns 



