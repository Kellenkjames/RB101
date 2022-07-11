# Convert the following case statement to an if statement.

stoplight = ['green', 'yellow', 'red'].sample

# Case statement is best suited for comparing multiple values to the same case. 

# case stoplight
# when 'green'
#   puts 'Go!'
# when 'yellow'
#   puts 'Slow down!'
# else
#   puts 'Stop!'
# end

puts stoplight

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else 
  puts 'Stop!'
end 
