#* Looping 

# When working with collections, it's common to perform a single action on each element in a collection. Instead of writing the action over and over again, loops can be used to perform an action on many, if not all, of the elements in a collection.

arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]

# This is how we would manually increment without using a loop. 

# --------------------------------------

#* Critical Learning

arr = [1, 2, 3, 4, 5]
counter = 0 

loop do 
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end 

arr # => [2, 3, 4, 5, 6]

# --------------------------------------

#* Controlling a Loop 

# In Ruby, a simple loop is created by calling the Kernel#loop method and passing a block to it. Any code within the block will be executed each time the loop performs an iteration. Because the loop method is in the Kernel module, it's available everywhere, just like puts and gets.

# In the following loop, 'Hello!' will be printed an infinte number of times. 

loop do 
  puts 'Hello!'
end 

# If we add the reserved word break after puts 'Hello!' then the loop will only iterate once. This is because when 'break' is executed, it exits the nearest loop. 

loop do 
  puts 'Hello!'
  break 
end 

# If we want loop to iterate more than once, we can use a conditional statement so that break is only called when a specific condition occurs. For example, let's say we have a variable named number that represents a random number. We can choose to exit the loop when number equals 5 by writing the if condition as number == 5.

loop do 
  number = rand(1..10) # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break 
  end 
end 

# --------------------------------------