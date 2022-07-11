# Modify the following code so that the value of name is printed within "Hello, !"

name = 'Elizabeth'

puts "Hello, #{name}!"

# Note: With string interpolation, you can invoke a variable - or a method - within a string, and Ruby will automatically call #to_s on the value. This allows us to include dynamic values within a string. Must be in double quotes.