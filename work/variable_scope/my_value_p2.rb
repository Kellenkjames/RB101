a = 7

def my_value(a)
  a += 10 # 17 --> now pointing to a different obj then the initialization of "a"
end

my_value(a)
puts a

# Answer: 7

# Explanation: Method definitions are self-contained with respect to local variables. Local variables outside the method definition are not visible inside the method definition. 

# the top level "a" is not available inside my_value. 

