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




