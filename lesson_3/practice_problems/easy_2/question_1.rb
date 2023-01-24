# Question 1

# In this hash of people and their age, see if "Spot" is present. 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.has_key?("Spot")
# => false

#_________________________________

# Bonus: What are two other hash methods that would work just as well for this solution?

ages.any?("Spot")
ages.include?("Spot")
