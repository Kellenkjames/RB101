# What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return # immediate exit from the method --> nil 
    end
  end
end

p count_sheep

# Answer: 0, 1, 2, nil 