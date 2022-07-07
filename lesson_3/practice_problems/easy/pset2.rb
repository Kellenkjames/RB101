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

# Question 4: See if the name "Dino" appears in the string below: 

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match?("Dino") # => false 

# Note, this is not a perfect solution, it will match any substring with Dino in it. 

# ----------------------------------------------------------------

# Question 5: Show an easier way to write this array: 

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# ----------------------------------------------------------------

# Question 6: How can we add the family pet "Dino" to our usual array:

# flintstones << "Dino"

# ----------------------------------------------------------------

# Question 7: How can we add multiple items to our array? (Dino and Hoppy)

flintstones.push("Dino", "Hoppy") # push returns the array so we can chain
p flintstones

# p flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item

# ----------------------------------------------------------------

# Question 8: Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index("house")) # "Few things in life are as important as"
p advice # "house training your pet dinosaur."

# As bonus, what happens if you use the String#slice method instead? 

#* Using slice, the non-destructive version of slice!, would return a new string with the same text ("Few things in life are as important as ") but the advice variable would remain the same, pointing to the original string ("Few things in life are as important as house training your pet dinosaur.")

# ----------------------------------------------------------------

# Question 9: Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
p statement.count('t')

# ----------------------------------------------------------------

# Question 10:  If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = 'Flinstone Family Members'
p title.center(40)








