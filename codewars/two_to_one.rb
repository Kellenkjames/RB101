
#* Two to One [7 kyu]

# Take 2 strings s1 and s2 including only letters from a to z. Return a "new" sorted string, the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.

# -----------------------------------

=begin

P - [Understanding the] Problem 

Inputs:
  - 2x strings

Output:
  - 1x string 

Implicit Requirements:
  - Take 2 strings (including only letters from "a" to "z")
  - Return a new sorted string (the longest possible), containing distinct letters - each taken only once

Explicit Requirements:
  - String should only contain letters from "a" to "z"
  
Clarifying Questions:
  - What if inputs have the same str length after removing duplicate values 

--------------------------------------------------------

E - Examples / Test Cases

a = "xyaabbbccccdefww"
b = "xxxxyyyyabklmopq"
longest(a, b) -> "abcdefklmopqwxy"

a = "abcdefghijklmnopqrstuvwxyz"
longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"


--------------------------------------------------------

D - Data Structure 

Arr[]

--------------------------------------------------------

A - Algorithm 

Algorithm:
def longest(a1, a2)
  - initialize an empty arr []
  - invoke each_char on a1  { |char| arr << char }
  - invoke each_char on a2  { |char| arr << char }
  - arr.uniq.sort.join("")
end 

=end

# --------------------------------------------------------

def longest(a1, a2)
  arr = []
  a1.each_char { |char| arr << char }
  a2.each_char { |char| arr << char }
  arr.uniq.sort.join("")
end 

a = "xyaabbbccccdefww"
b = "xxxxyyyyabklmopq"
p longest(a, b)  # -> "abcdefklmopqwxy"