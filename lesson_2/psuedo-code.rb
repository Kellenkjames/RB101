# Psuedo-Code 

# Psuedo-code is meant for humans to read. It's not meant for machines or programs to process, and therefore there's no rigid format to follow. Human brains are far more flexible and powerful than programming language interpreters or compilers.

# Basic Pseudo-Code 

=begin

Given a collection of integers. 

Iterate through the collection one by one. 
- save the first value as the starting value. 
- for each iteration, compare the save  d value with the current value.
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

# Psuedo-Code practice 

#-------------------------------------------------------------

# Example 1)

=begin

Basic Pseudo-Code 

Given a method, return the sum of two integers. 

Define a method with that accepts two parameters:
- pass the first parameter into method body
- pass the second paramter into method body
- create variable to store sum str
- add the sum of first & second parameter
- store the reuslt back into the sum str variable

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

PRINT sum_integers(5, 10)

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

Given a method that takes an array of strings, returns a string that is all those strings concatenated together

Define a method that takes an array of strings:
- pass ary of strings as a parameter to method body
- create a variable and assign to arr with hard-coded values i.e. [1, 2, 3]
- invoke the concat method on the variable and ary of strings as argument 
- return value 

Formal Pseudo-Code

START

# Given a method that takes an array of strings, returns a string that is all those strings concatenated together

SET str_concat(str)
  a = [1, 2, 3]
  a.concat(str)
end

PRINT str_concat(["Hello", "This", "Is", "RB101", "Programming", "Foundations"])

END

=end 

def str_concat(str)
  a = [1, 2, 3]
  a.concat(str)
end

p str_concat(["Hello", "This", "Is", "RB101", "Programming", "Foundations"])

#-------------------------------------------------------------

# Example 3)

=begin

Basic Pseudo-Code 

Given a method that takes an array of integers and returns a new array with every other element from the original array, staring with the first element. 

Define a method that takes an array of integers
- create variable to store mutated arr
- invoke select method to filter out every other elements (starting with the first)

After iterating through the collection, return the saved value. 

END

Formal Pseudo-Code 

START

# Given a method that takes an array of integers and returns a new array with every other element from the original array, staring with the first element.

SET every_other(arr)
  SET new_arr = arr.select {|x| arr.index(x) % 2 ==0 }
  new arr
end 

END 

=end

def every_other(arr)
  new_arr = arr.select { |x| arr.index(x) % 2 == 0 }
  new_arr
end    

p every_other([1,4,7,2,5]) # => [1,7,5]

#-------------------------------------------------------------

# Example 4

=begin

Basic Pseudo-Code 

Given a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

Define a method that accepts a two arguments
  - pass two args into method (char, str)
  - invoke split method on string to reutrn sub array of strings
    - store sub array of strings in variable called "arr"
  - invoke count method on arr variable
    - store return value in variable called "count"
  - IF count is less than 3
    - return nil
  - ELSE 
    - Iterate and find the index of the 3rd "char"

    Return "index" and display to user 

END

Formal Pseudo-Code

START

# Given a method that determines the index of the 3rd occurrence of a given character in a string. 

def index_count(char, str)
  SET arr = str.split("")
  SET count = arr.count(char) 

  IF count is less than 3
    return nil 
  ELSE
    Iterate and find the index of the 3rd "char"  
  end 
end 

PRINT index_count("x", "axbxcdxex")

END 

=end

def index_count(char, str)
  # Split string into character sub array
  arr = str.split("")

  # Find number of occurences 
  count = arr.count(char) 

  if count < 3
    return nil 
  else
      # Iterate and find the index of the 3rd "char"
      arr  
  end 
end 

p index_count("x", "axbxcdxex")

#-------------------------------------------------------------

# Example 5)

=begin

Basic Pseudo-Code 

# Given a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:

merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

Define a method "merge" that accepts two arrays as arguments: 
- create empty arry and store in a variable 
- store arrOne arg in a variable 
- store arrTwo arg in a variable
- push arrOne to empty arr
- push arrTwo to empty arr
- call arr.flatten method on arr


Formal Pseudo-Code

START

# Given a method that takes two arrays of numbers and returns the result of merging the arrays where the elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. 

SET merge(arrOne, arrTwo)
  SET arr = []

  arr.push(arrOne, arrTwo)
  arr.flatten # => [1, 2, 3, 4, 5, 6]
  
  arr.each_index do |x|
    IF x.even? 
      SET elements of the first arr to the elements at the even indexes 
    ELSE 
      SET elements of the second arr to the elements at the odd indexes  
  end 

end 
  
END 

PRINT merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

=end