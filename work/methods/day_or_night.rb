# Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

def time_of_day(daylight)  # Note: This paramter is a variable local to the time_of_day method 
  if daylight
    puts "It's daytime!"
  else 
    puts "It's nighttime!"
  end 
end

daylight = [true, false].sample 
time_of_day(daylight)
