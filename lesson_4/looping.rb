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

#* Iteration 

# Although we have an if condition for break, we still don't know how many times the loop will iterate because number represents a random number. We can tell loop to iterate a specific number of times by using a variable that tracks the number of iterations performed. Before loop is implemented, let's assign a variable counter that represents the current iteration number.

# In order to align the value of counter and the number of iterations, we need to increment counter by 1 during each iteration. This will ensure that loop only iterates five times.

counter = 0 

loop do 
  puts 'Hello!'
  counter += 1
  break if counter == 5
end 

#* Notice that counter is initialized outside of the loop. If we had initialized it inside of the loop it would be reassigned to 0 on each iteration and the break condition would never be met. 

# --------------------------------------

#* if modifier 

# Here we shortened the if statement by changing it to an if modifier. An if modifier is implemented by appending the keyword if and the condition to a statement. In this case, the statement is break. 

break if number == 5 

# This generally makes the code more readable but should only be used when applicable. If there are multiple lines of code within the if statement then a modifier can't be used (notice we removed the puts ' Exiting...' line).

# --------------------------------------

#* Break Placement 

# This example of loop - where break is placed on the last line within the loop - mimics the behavior of a "do/while" loop. With a "do/while" loop, the code within the block is guaranteed to execute at least once.

counter = 0 

loop do 
  puts 'Hello!'
  counter += 1
  break if counter == 5
end 

# If we move break to the first line within the loop, this will then mimic the behavior of a while loop. The while keyword always precedes a condition. If the condition evaluates as true, the loop will execute the code within the block. If the condition evaluates as false, the loop will stop. This means the code below break may or may not execute at all, depending on the condition.

counter = 0 

loop do 
  break if counter == 0
  puts 'Hello!'
  counter += 1
end

# In our example, if we move break to the first line within the loop and change the condition to counter == 0, then the loop will stop immediately and not execute any code after break.

# --------------------------------------


