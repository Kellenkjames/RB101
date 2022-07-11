# Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <=10
end

# Note: In the terminal output, if you see a list of values - it means we had to loop through the random numbers "several" times before the random number generated was "between" 0 and 10. 

# You can see this as the last value in the terminal output. 