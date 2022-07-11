a = 7

def my_value(b)
  a = b # 12  --> The reference of "a" is pointing to a different obj than the initialization of "a" on line 1
end

my_value(a + 5) # 12 
puts a

# Answer: 7

# Explanation: The local variable "a" inside the my_value method definition is not visible outside the my_value method definition. 