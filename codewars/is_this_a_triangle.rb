
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

# ------------------------------------------------

* D - Data Structure 

# => N/A 

# ------------------------------------------------

* A - Algorithm 

Algorithm: 
  b + c > a ? true : false
end 

=end 

# ------------------------------------------------

#* C - Code 

def is_triangle(a, b, c)
  b + c > a ? true : false 
end 

is_triangle(1, 2, 2)
is_triangle(7, 2, 2)


