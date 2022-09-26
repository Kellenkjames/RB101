
require 'pry'

# Is this a triangle? 

#* Implement a function that accepts 3 integer values a, b, c. The function should return true if a triangle can be built with the sides of given length and false in any other case.

# ------------------------------------------------

=begin

* P - [Understanding the] Problem 

Inputs:
  - 3 integer values 

Output:
  - Boolean 

Implicit Requirements: 
  - Method will accept 3 integer values (a, b , c)
  - Method should return true if a triangle can be built with the sides of given length and false in any other case. 

Explicit Requirements:
  - All triangles must have surface greater than 0 to be accepted. 
  - The sum of any "two sides" of a triangle must be larger than the "third" side 

Clarifying Questions: 
  - How to determine if the three sides make up a triangle? 

# ------------------------------------------------

* Examples / Test Cases 

is_triangle(1, 2, 2) == true 
is_triangle(7, 2, 2) == false 
is_triangle(9, 3, 8) == true 
is_triangle(3, 1, 10) == false 
is_triangle(2, 7, 4) == false 

# ------------------------------------------------

* D - Data Structure 

# => N/A

# ------------------------------------------------

* A - Algorithm:

Algorithm: 
- check to make sure each input is greater than 0 (no negative numbers allowed):
    return false if a < 0 || b < 0 || c < 0 
- conditional logic (sum of two inputs must be greater than a single input):
    a + b > c && 
    b + c > a && 
    a + c > b ? true : false
  end 
end 

end

=end 

# ------------------------------------------------

#* C - Code 

def is_triangle(a, b, c)

  return false if a < 0 || b < 0 || c < 0 
  
  a + b > c && 
  b + c > a && 
  a + c > b ? true : false 

end 

is_triangle(1, 2, 2) 
is_triangle(7, 2, 2) 
is_triangle(9, 3, 8) 
is_triangle(3, 1, 10) 
is_triangle(2, 7, 4) 
