#* Assignment: TTT Bonus Features 

# Improved "join"

# Currently, we're using the Array#join method, which can only insert a delimiter between the array elements, and isn't smart enough to display a joining word for the last element.

# Write a method called joinor that will produce the following result:

# ---------------------------------------------

=begin

* P - [Understanding the] Problem 

Inputs:
- Arr

Outputs:
- Str 

Explicit Requirements: 
- Method needs to produce output that includes "and" || "or" before the last element. 

Implicit Requirements:
- If there is no argument for the delimeter, "or" will be placed before the last element. 
- If the last argument is an empty space, "or" will be placed before the last element. 
- If the the last argument is 'and', i.e., 'and' will be placed before the last element.  

Clarifying Questions: 
- Will the value ever be anything other than "or" || "and"? 

# ---------------------------------------------

* E - Examples / Test Cases 

joinor([1, 2])                      # => "1 or 2"
joinor([1, 2, 3])                  # => "1, 2, or 3"
joinor([1, 2, 3], '; ')            # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# ---------------------------------------------

* D - Data Structure 

=> Arr[]

[1, "or", 2] => "1 or 2"


# ---------------------------------------------

* A - Algorithm 

# Algorithm:
  - arr_join = arr
  - if delimeter args are not provided || delimeter == ' ' 
    - arr.insert(last_index, "or")
  - elsif delimeter == 'and'
    - arr.insert(last_index, "and")
  end 
  arr_join(delimeter)
  
=end 

# ---------------------------------------------

#* C - Code 

def joinor(arr, delimeter="")

  if arr.size == 2 && !!delimeter 
    arr.insert(arr[-2], 'or').join(" ")
  elsif arr.size > 2 && !!delimeter
    arr.insert(arr[-2], 'or').join(", ")
  end 
end 

p joinor([1, 2])
p joinor([1, 2, 3])


