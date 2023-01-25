# Question 3

# Alan wrote the following method, which was intended to show all of the factors of the input number:

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop.

# How can you make this work without using the begin/end until construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

#____________________________________________

# Bonus 1: What is the purpose of the number % divisor == 0 ?

  #* Allows you to determine if the result of the division is an integer number (no remainder).

# Bonus 2: What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

  #* The purpose of line 8 is to make `factors` the return value of the method.
  