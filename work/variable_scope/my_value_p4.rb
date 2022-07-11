a = "Xyzzy"

def my_value(b) # this binds the paramater "b" to our string
  b[2] = '-' 
end

my_value(a) # "Xyzzy"
puts a

# Answer: Xy-xz

# Explanation: Unlike Numbers, Strings are mutable - they can be modified - and in particular, the method String#[] = is a mutating method

#  We are modifying the string referenced by "b", and "b" references the same string as "a", the result from printing "a" shows an update to the value of the string. 