a = 7

def my_value(b)
  b = a + a 
  # b = b + b (this would work)
end

my_value(a) 
puts a

# Answer: Undefined - there is no local variable "a" defined within this method. 

# Explanation: Even though "a" is defined before my_value is defined, it is not visible inside my_value. Method definitions are self contained with respect to local variables. 

# Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition. 