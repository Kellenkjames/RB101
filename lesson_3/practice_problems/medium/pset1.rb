#* Practice Problems: Medium 1

# Question 1: "ASCII Art" Write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right: 

10.times { |number| puts (" " * number) + 'The Flinstones Rock!' }

# ----------------------------------------------------------------

# Question 2: The result of the following statement will be an error: 

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this: This will raise an error TypeError: no implicit conversion of Integer into String because (40+2) results in an integer and it is being concatenated to a string.

#* One possible way to fix: String interpolation 
puts "the value of 40 + 2 is #{40 + 2}"

#* Second possible solution: Use .to_s method 
puts "the value of 40 + 2 is " + (40 + 2).to_s

# ----------------------------------------------------------------

# Question 3: Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0 
    divisor -= 1
  end
  factors
end

puts factors(20)

# Bonus 1: What is the purpose of the number % divisor == 0 
#* Allows you to determine if the result of the division is an integer number (no remainder)

# Bonus 2: What is the purpose of the second-to-last-line 
#* This is what is the 'actual' return value from the method. Recall that without an explicit return statement in the code, the return value of the method is the last statement execuited. If we removed this line, the code would executre, but the return value of the method would be nil. 