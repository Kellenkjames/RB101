#* Practice Problems: Easy 2

# Question 1: In this hash of people and their age, see if "Spot" is present. 

# Bonus: What are two other hash methods that would work just as well for this solution? 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Solution
p ages.key?("Spot") # => false 

# Other hash methods 
p ages.include?("Spot") # => false
p ages.member?("Spot") # => false

# ----------------------------------------------------------------

# Question 2: Convert the string in the following ways (code will be executed on original munsters_description above):

munsters_description = "The Munsters are creepy in a good way." 

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.swapcase!

# "The munsters are creepy in a good way."
p munsters_description.capitalize! 

# "the munsters are creepy in a good way."
p munsters_description.downcase!

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.upcase!

# ----------------------------------------------------------------

# Question 3: We have most of the Munster family in our age hash: 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# Add ages for Marilyn and Spot to the existing hash 

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

# ----------------------------------------------------------------





