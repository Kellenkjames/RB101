# Use Array#map to iterate over numbers and return a new array with each number doubled. Assign the returned array to a variable named doubled_numbers and print its value using #p.

numbers = [1, 2, 3, 4, 5]

doubled_numbers = numbers.map { | number | number * 2 }
p doubled_numbers

# Array#map iterates over an array and returns a "new array" with each element transformed based on the block's return value.

# Note: Use map when you need to "transform" an array and return a new arr (each does not return a new arr)