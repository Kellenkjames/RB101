# Psuedo-Code 

# Psuedo-code is meant for humans to read. It's not meant for machines or programs to process, and therefore there's no rigid format to follow. Human brains are far more flexible and powerful than programming language interpreters or compilers.

# Basic Pseudo-Code 

=begin

Given a collection of integers. 

Iterate through the collection one by one. 
- save the first value as the starting value. 
- for each iteration, compare the saved value with the current value.
- if the saved value is greater, or it's the same 
  - move to the next value in the collection
  - otherwise, if the current value is greater 
  - reassign the saved value as the current value 
  
  After iterating through the collection, return the saved value. 
  
=end 
  
#-------------------------------------------------------------

=begin 

# Formal Pseudo-Code 

START 

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers 
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

    iterator = iterator + 1

    PRINT saved_number

  END

=end 

# Translating Pseudo-Code to Program Code 

def find_greatest(numbers)
  saved_number = numbers[0]

  return if numbers.nil? 

  numbers.each do |num| 
    if saved_number >= num 
      next 
    else 
      saved_number = num 
    end
  end
  
  saved_number
end 

find_greatest([100, 6, 5, 10, 25, 87])

# Note: Pseudo-code is a guess at the solution and there's no verification that the logic is correct. Only when you translate it to actual programming code is the logic being verified. 

#-------------------------------------------------------------

# Psuedo-code practice 

#-------------------------------------------------------------

# Example 1)

=begin

Basic Pseudo-Code 

a method that returns the sum of two integers: 

Given a method, return the sum of two integers. 

Define a method with that accepts two parameters:
- pass the first parameter into method body
- pass the second paramter into method body
- create variable to store sum output
- add the sum of first & second parameter
- store the reuslt back into the sum output variable

Call the method with different arguments 

Formal Pseudo-Code

START

# Given a method, return the sum of two integers. 

SET parameters (num1, num2)
SET sum = num1 + num2 

def sum_integers(num1, num2)
  sum = num1 + num2
  sum 
end 

PUTS sum_integers(5, 10)

END 

=end 

def sum_integers(num1, num2)
  sum = num1 + num2
  sum
end 

puts sum_integers(20, 30)

#-------------------------------------------------------------

# Example 2)

=begin

Basic Pseudo-Code 

a method that takes an array of strings, and returns a string that is all those strings concatenated together

Given a method that takes an array of strings, returns a string that is all those strings concatenated together

Define a method that takes an array of strings:
  - create a variable and assign to arr with hard-coded values i.e. [1, 2, 3]
  - invoke the concat method on the variable and ary of strings as argument 
  - return value 

Formal Pseudo-Code

START

# Given a method that takes an array of strings, returns a string that is all those strings concatenated together

SET output = str.concat

def str_concat(str)
  a = [1, 2, 3]
  a.concat(str)
end

END

=end 

def str_concat(str)
  a = [1, 2, 3]
  a.concat(str)
end

p str_concat(["Hello", "This", "Is", "RB101", "Programming", "Foundations"])