# Using the following code, print true if colors includes the color 'yellow' and print false if it doesn't. Then, print true if colors includes the color 'purple' and print false if it doesn't.

colors = 'blue pink yellow orange' 

puts colors.include?("yellow") # true 
puts colors.include?("purple") # false

# Note: To check whether a given string includes a "specific" substring, we can use String's #include? method. This method checks the calling string to see whether it contains the argument as a substring. 