# What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal

# Answer: Breakfast

# Reason: The method exists on line 4 when the return statement is executed and returns the provided value. Therefore, it will never output anything below it. 