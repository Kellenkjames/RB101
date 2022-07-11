# Given the array below, use loop to remove and print each name from first to last. Stop the loop once names doesn't contain any more elements.

# Gotcha : Shift returns the removed "value"

names = ['Sally', 'Joe', 'Lisa', 'Henry']

# From first to last
loop do 
  puts names.shift 
  break if names.empty?
end 
p names 