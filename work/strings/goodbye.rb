# Given the following code, invoke a destructive method on greeting so that Goodbye! is printed instead of Hello!.

greeting = 'Hello!'
greeting.gsub!('Hello!', 'Goodbye!')

puts greeting

# Note: Ruby provides a great String method named String#gsub! that allows us to replace a specific characters within the string by modifying the original object. 

