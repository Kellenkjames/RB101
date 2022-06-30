# Pass by Reference vs Pass by Value

# This discussion stems from trying to determine what happens to objects when passed into methods. In most programming languages, there are two ways of dealing with objects passed into methods:

#* You can either treat these arguments as:
# 1. "references" to the original object 
# 2. "values" copies of the original 

#* What does pass by "value" mean? 
# The method only has a copy of the original object. Operations performed on the object within the method have no effect on the "original" object outside of the method

# Example:
def change_name(name)
  name = 'bob'              # does this reassignment change the object outside the method?
end 

name = 'jim'
change_name(name)   # => bob
puts name                     # => jim 

# It looks like it was passed by value, since re-assigning the variable only affected the method-level variable, and not the main scope variable. 

#* What does pass by "reference" mean? 
# However, it's not quite that simple. If Ruby was pure "pass by value", that means there should be no way for operations within a method to cause changes to the original object. But you can plainly do this in Ruby. For example: 
def cap(str)
  str.capitalize!      # does this affect the object outside the method?
end 

name = "jim"
cap(name)
puts name         # => Jim

# This implies that Ruby is "pass by reference", because operations within the method affected the original object. However, as we saw with the re-assignment example, not all operations affect the original object. For example: 
def cap(str)
  str.capitalize
end 

name = "jim"
cap(name)
puts name          # => jim

#* What Ruby does 
# Ruby exhibits a combination of behaviors from both "pass by reference" as well as "pass by value". 

#The most important concept you should remember is:
#* when an operation within the method mutates the caller, it will affect the original object, otherwise it won't. 

# The natural question is then, which operations mutate the caller? Unfortunately, this is something you'll have to slowly disover through usage and reading documentation.  

#* In the Ruby core library, a lot of destructive (another term for mutating the caller) methods end with a !. But that's just a naming convention, and it's not a guarantee. 

# For example, the Array #<< method is destructive, but doesn't end with a !. 
def add_name(arr, name)
  arr << name 
end 

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect # => ["bob", "kim", "jim"]

# You can see that by sending the names array through the add_name method, it permanently changed the original "names" array. 

#* re-assignment is not considered a destructive operation 
def add_name(arr, name)
  arr = arr + [name]
end 

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect            # => ["bob", "kim"]

# Another example using a destructive method: 
def add_name(arr, name)
  arr = arr << name # mutating the original array
end 

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect           # => ["bob", "kim", "jim"]
