a = 7

def my_value(b)
  b += 10 # 17 --> now pointing to a different obj then the initialization of "a"
end 

my_value(a)   
puts a 

# Answer: 7 

# Explanation: In Ruby, numbers are immutable, there is no way we could have mutated the object that "a" references from inside the my_value method. 
