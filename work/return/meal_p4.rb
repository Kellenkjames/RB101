# What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal 

# Answer: Dinner, Breakfast

=begin

Reason: The method will print both strings because we have 2x instances of #puts 

Note: When you use #puts it's important to know that the printed value and the return value are not the same. #puts outputs the value it's given and returns nil. 

Therefore, the return value of puts 'Dinner' is nil. However, that's not the return value of "meal"

The return value of meal is 'Breakfast' because of the explicit return. 
  
= end

