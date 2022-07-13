#* Even or Odd? 

# Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

count = 1

loop do
  count += 1
  count.even? puts "#{count}: number is even" : puts "#{count}: number is odd"
  break if count > 5
end