# What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# Answer: 0, 1, 2, 3, 4, 5

# Reason: If you study #times in the Ruby docs, you'll know that after iterating 5 times, the block returns the initial integer which in this case is 5 --> 5.times 
