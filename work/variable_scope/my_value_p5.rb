a = "Xyzzy"

def my_value(b) # "b" is being set to reference the same string that is referenced by "a"
  b = 'yzzyX'
end

my_value(a) # Xyzzy
puts a

# Answer: Xyzzy 

# Explanation: Assignment never changes the value of an object; instead; it creates a new object, and then stores a reference to that object in the variable on the left. 

# Notes: b references the string "yzzyX", while "a" remains unchanged: it still references "Xyzzy"