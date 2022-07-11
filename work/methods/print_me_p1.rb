# Write a method named print_me that prints I'm printing within the method! when invoked as follows:

def print_me
  puts "I'm printing within the method!"
end

print_me

# Note: In Ruby, methods return the evaluated result of the last line that is "executed" . puts always returns "nil" therefore if puts is the last line within the method - it will always return nil. 