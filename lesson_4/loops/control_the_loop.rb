#* Control the Loop 

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# Further Exploration 

# If the break statement is moved up one line so it runs before iterations is incremented, what would need to be changed?

#* Iteration count would need to be changed from 5 to 4