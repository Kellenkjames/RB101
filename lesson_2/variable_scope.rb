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


