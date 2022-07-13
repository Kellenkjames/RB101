#* Print While 

# Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

#rand returns a random number between 0 and one less than the number provided. 

numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers